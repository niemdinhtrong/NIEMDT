# Cài đặt wordpress đặt BD trên máy khác

## Chuẩn bị

Chuẩn bị 2 máy chạy HĐH CentOS7. Một máy đóng vai trò Web Server và một máy đóng vai trò là maý MySQL server.

## Mô hình như sau

![](/linux/images/wordpress/1.png)

Trong đó 
 * Dải IP 192.168.50.x/24 là dải IP local không thể ra được internet.
 * IP 192.168.122.166 được sử dụng để ra ngoài internet.

## Cấu hình

### Trên máy MySQL

**Cài đặt MySQL server**

Chạy lần lượt các lệnh sau:

```

wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm

rpm -ivh mysql-community-release-el7-5.noarch.rpm

yum install mysql-server

```

Khởi động MySQL

```
systemctl start mysqld
```

Chạy lệnh sau để thiết lập tài khoản `root`

```
mysql_secure_installation
```

Để kiểm tra ta truy cập thử MySQL với tài khoản `root`.

**Tạo Database cho wordpress**

Đăng nhập vào MySQL với user `root`

```
mysql -u root -p
```

Tạo user và database để sử dụng cho wordpress

```
create database tên-database;

create user 'user'@'IP' identified by 'pass';

grant all privileges on tên-database to 'user'@'IP';

flush privileges;

```

Trong đó

 * `tên-database` là tên database sử dụng cho wordpress
 * `user` là tên user sử dụng để wordpress kết nối vào MySQL
 * `IP` là địa chỉ của máy Web Server để truy cập MySQL


### Trên máy Web server

**Apache**

Chạy lệnh sau để cài đặt

`yum install httpd -y`

Khởi động Apache và cho phép khởi động cùng hệ thống

```
systemctl start httpd

systemctl enable httpd
```

Tắt firewall

```
systemctl stop firewalld
```

Để kiểm tra ta mở trình duyệt và truy cập vào địa chỉ IP của web server

`http://địa-chỉ-IP`

Kết quả trả về như sau

![](/linux/images/wordpress/2.png)

**Cài PHP**

Sử dụng `yum` để cài PHP

```
yum install php php-mysql php-gd php-pear –y
```

Để test PHP đã cài đặt thành công chưa

Thực hiện lệnh

```
echo "<?php phpinfo(); ?>" > /var/www/html/info.php
```

Sau đó restart lại `httpd`

```
systemctl restart httpd
```

Mở trình duyệt web truy cập địa chỉ `http://địa chỉ Ip/info.php`

Kết quả trả về như sau là thành công

![](/linux/images/wordpress/3.png)

**Cài wordpress**

Truy cập vào thư mục `html`

```
cd /var/www/html
```

Dowload file để cài wordpress từ internet

```
wget https://wordpress.org/latest.tar.gz
```

Giải nén tập tin 

```
tar xzvf latest.tar.gz
```

Cấu hình wordpress để kết nối với MySQL

```
cd /var/www/html/

mv wordpress/* /var/www/html/

mv wp-config-sample.php wp-config.php
```

Sửa file

```
vi wp-config.php
```

Sau đó tìm các dòng sau để sửa thông tin

```
define('DB_NAME', 'datawordpress');     # tên database tạo ở trên

define('DB_USER', 'niemdt');     # tên user vừa tạo

define('DB_PASSWORD', 'password');      # password của user bên trên

define('DB_HOST', '192.168.50.219');    # IP của máy MySQL
```

Sau đó lưu các thay đổi

Bây giờ mở trình duyệt và truy cập địa chỉ của bạn để tiến hành cấu hình wordpress.

Sau khi cấu hình và đăng nhập vào sẽ có được giao diện như sau

![](/linux/images/wordpress/4.png)