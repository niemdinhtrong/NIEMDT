## Mục lục

[Một số khái niệm](#1)
 * [Hệ quản trị CSDL](#1.1)
 * [MySQL](#1.2)

[Các lệnh với MySQL](#2)

[Khóa](#3)
 * [Khóa chính](#3.1)
 * [Khóa ngoại](#3.2)

[Các dạng chuẩn hóa CSDL](#4)
 * [Dạng chuẩn 1NF](#4.1)
 * [Dạng chuẩn 2NF](#4.2)
 * [Dạng chuẩn 3NF](#4.3)

[Quan hệ giữa các bảng](#5)

<a name="1">

## Một số khái niệm

<a name="1.1">

**1. Hệ quản trị cơ sở dữ liệu**

Hệ quản trị cơ sở dữ liệu (Database Management System-DBMS) là một hệ thống hay phần mềm được thiết kế dùng để quản trị một cơ sở dữ liệu. Cụ thể các chương trình này có khả năng tạo, sửa, xóa, tìm kiếm thông tin trong cơ sở dữ liệu.

<a name="1.2">

**2. MySQL**

`SQL` là ngôn ngữ truy vấn theo cấu trúc.

`MySQL` là một hệ quản trị cơ sở dữ mã nguồn mở sử dụng ngôn ngữ truy vấn `SQL`.

Với `MySQL` ta có thể quản lý cơ sở dữ liệu bằng giao diện đồ họa thông qua một số phần mền ví dụ như `workbench` hoặc có thể dùng câu lệnh để thao tác với CSDL.

<a name="2">

## Một số lệnh với mysql

**Cài mysql**

`wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm`

`rpm -ivh mysql-community-release-el7-5.noarch.rpm`

`yum install mysql-server`

`systemctl start mysqld`

Chạy lệnh `mysql_secure_installation` để setup mật khẩu cho root

**Tạo user**

Login trên local `mysql -u root -p`

Cài mysql client `yum install mysql`

Login remote `mysql -u user-name -p -h IP`

Tạo user `create user 'user-name'@'IP' identified by 'password'`

Trong đó:

 * `IP` có thể là đại chỉ máy IP ở xa cho phép login vào hoặc là `localhost` nếu chỉ cho login vào tại chính máy local. Để `%` nếu cho phép tất cả các máy login vào.

Cấp quyền cho user `grant quyền on data-name.table-name to 'user-name'@'IP'`

Trong đó các quyền có thể gán cho user:

 * `ALL PRIVILEGES` tất cả các quyền
 * `CREATE` cho phép tạo bảng hoặc databases mới
 * `DROP` xóa bảng hoặc databases
 * `DELETE` xóa dữ liệu trong bảng
 * `INSERT` Thêm thông tin vào bảng
 * `SELECT` được dùng lệnh select để đọc dữ liệu
 * `UPDATE` update dữ liệu trong bảng
 * `GRANT OPTION` được thêm xóa user, quyền của user

Data và table nếu muốn áp dụng cho tất cả thì dùng dấu `*` để thay thế.

Chạy lệnh `FLUSH PRIVILEGES` để áp dụng những gì vừa thiết lập.

Xóa quyền của 1 user `REVOKE type_of_permission ON database_name.table_name FROM ‘username’@‘localhost’;`

Show các quyền đang được áp dụng với user `show grants user-name`

Xóa user `DROP USER 'user-name'@'IP'`

Xem các user trên mysql server `select host, user, password from mysql.user`

Xem các thuộc tính user `desc mysql.user;`

Tạo database `CREATE database tên-database;`

Xóa database `DROP database tên-database;`

Thao tác với một dữ liệu `USE tên-database;`

**Một số kiểu dữ liệu**

### Kiểu số

`INT` 

`FLOAT(n,m)`- số thực dấu chấm động

`DOUBLE(n,m)`

**Kiểu date time**

`DATE` YYYY-MM-DD. Ví dụ 2019-01-28.

`DATETIME` YYYY-MM-DD HH:MM:SS. Ví dụ 23h00 ngày 28-01-2019 được biểu diễn 2019-01-28 23:00:00

`TIME` HH:MM:SS

`YEAR(m)` m có thể là 2 hoặc 4. Mặc định là 4

**Kiểu chuỗi**

`CHAR(m)` độ dài cố định từ 1 đến 255 ký tự. Nếu 1 trường kiểu char có độ dài không bằng độ dài khai báo thì phần còn thiếu được thêm bằng ký tự trắng.

`VARCHAR(m)` độ dài có thể thay đổi.

`BLOB` hoặc `TEXT` độ dài tối đa 65535 ký tự. BLOB sử dụng lưu trữ dữ liệu nhị phân như các bức ảnh hoặc tập nhị phân khác. `BLOB` phân biệt chữ hoa chữ thường còn `TEXT` thì không.

### Tạo bảng

Tạo bảng 

CREATE TABLE table-name(các trường trong bảng);

VD:

create table bang1(
mssv INT NOT NULL AUTO_INCREMENT,
ho VARCHAR(50) NOT NULL,
ten VARCHAR(30) NOT NULL,
diemthi FLOAT(2,2),
PRIMARY KEY (mssv)
);

Trong đó: 
 
 * `NOT NULL` không được để trông giá trị
 * `AUTO_INCREMENT` tự động tăng (giống STT)
 * `PRIMARY KEY` khai báo khóa chính. Nếu khai báo nhiều khóa chính cùng lúc thì thay lại bằng câu `CONSTRAINT ma PRIMARY KEY (các trường)`

 * Thiết lập khóa ngoại `FOREIGN KEY (Masv) REFERENCES HSSV(Masv)`

Xóa bảng `DROP TABLE tên-bảng`

Ghi dữ liệu  

```
insert into tên-bangr ( truong1, truong2, ...)
Values (giá trị lần lượt theo các trường đã khai báo ở trên)
```

**SELECT**

Kết hợp với các mệnh đề khác để truy xuất dữ liệu

`SELECT các trường FROM tên-bảng`

Các trường có thể để là `*` nếu muốn truy xuất tất cả các trường trong bảng.

**WHERE**

`SELECT * FROM tên-bảng WHERE điều kiện`

VD: `SELECT * FROM bang1 WHERE ten="niem";`

**LIKE** 

Like thường được sử dụng kết hợp với các mệnh đề khác. Hay được dùng chung với WHERE và được thay thế cho dấu bằng. Có thể dùng ký tự `%` để tìm kiếm giống như `*` trong linux.

**UPDATE**

Dùng để cập nhật dữ liệu của một hoặc nhiều trường

```
UPDATE tên-bảng SET truong1=gia-tri-moi, truong2=gia-tri-moi
WHERE
```

**DELETE**

`DELETE FROM tên-bảng WHERE `

Chú ý đến mệnh đề WHERE nếu ko có sẽ dẫn đến xóa cả bảng.

**ORDER BY**

Được sử dụng để sắp xếp kết quả hiển thị trả về

```
SELECT * FROM tên-bảng
ORDER BY truongn [ASC][DESC]
```

Có thể chọn kết quả trả về của bất kỳ trường nào
Sử dụng một trong hai khóa `ASC` để hiển thị kết quả theo thứ tự tăng dần hoặc `DESC` để hiển thị theo giá trị giảm dần.

**JOIN**

Được dùng để lấy dữ liệu cùng lúc từ nhiều bảng và ghép chúng lại với nhau.

VD

```
SELECT a.mssv, a.ten, b.hocphi
FROM bang1 a, bang2 b
WHERE a.ten=b.ten;
```
Kết quả sẽ trả về mã số sv và tên trong bảng 1 và học phí trong bảng 2 nếu tên trong bảng 1 và bảng 2 là trùng nhau.

**NULL**

Để so sánh một trường nào đó với giá trị NULL ta dùng lệnh

`truong1 IS NULL`
hoặc `truong1 IS NOT NULL`

**ALTER**

Lệnh này được dùng để thay đổi tên cho bảng hay bất kỳ trường nào cho bảng như thêm bớt sửa xóa.

VD: Xóa một trường `ALTER TABLE tên-bảng DROP tên-trường`

ADD thêm một trường sau trường nào đó `ALTER TABLE tên-bảng ADD ten CHAR(40) AFTER hocphi;`
Thêm cột tên sau cột học phí.

Định nghĩa một trường theo tên mới 

`ALTER TABLE tên-bảng CHANGE ten hoten CHAR(40);`    Thay trường tên bằng họ tên.

Một số lệnh để show thông tin trên Mysql server

 * select version()  phiên bản server
 * select database() tên database hiện tại
 * select user()     username hiện tại
 * show status       trạng thái server
 * show variables    các biến cấu hình server

**BETWEEN**

Thay vì dùng mệnh đề where như sau

```
select * from tên-bang
where diemthi >= 8 and diemthi <= 10;
```

Ta có thể sử dụng

```
select * from tên-bảng
where diemthi BETWEEN 8 and 10;
```
<a name="3">

## Khóa 

<a name="3.1">

**Khóa chính**

`Khóa chính` để định danh duy nhất mỗi bản ghi trong một bảng của cơ sở dữ liệu.

Dữ liệu trong trường khóa chính phải là duy nhất và ko được chứa giá trị NULL.

Mỗi bảng chỉ có một khóa chính và khóa chính có thể tạo ra từ nhiều trường trong bảng.

<a name="3.2">

**Khóa ngoại**

Khóa ngoại của bảng này được coi như một con trỏ trỏ tới khóa chính của bảng khác.

Hay có thể hiểu một trong bảng này có một trường mà trường này lại là khóa chính của một bảng khác. Thì trường đó trong bảng này được gọi là khóa ngoại.

<a name="4">

## Các dạng chuẩn hóa CSDL

Chuẩn hóa là quá trình phân tách các bảng thành các bảng nhỏ hơn dựa và các phụ thuộc hàm

Các dạng chuẩn là các chỉ dẫn để thiết kế các bảng trong CSDL.

Mục đích của chuẩn hóa là làm giảm dữ liệu dư thừa và các lỗi xảy ra khi cập nhật CSDL. Nhưng điều này làm tăng thời gian truy vấn dữ liệu.

<a name="4.1">

**Dạng chuẩn 1NF**

Một bảng được gọi là 1NF khi và chỉ khi toàn bộ các miền giá trị của các cột có mặt trong bảng đều chỉ chứa các giá trị nguyên tử(nguyên tố)

VD

Một bảng chưa ở 1NF:

| MASV	| HOTEN	| DIACHI	| MAMON	| TENMON	| DIEM |
| ------ | --- | ------ | -------- | -------- | ------ |
| A01	| Lê Na |	12 Thái Hà |	M01M02	| CSDLAnh	| 89 |
| A02	| Trần An	| 56 Mã Mây	| M01	| CSDL	| 8 |
| A03	| Hà Nam	| 24 Cầu Gỗ	| M01M02M03	| CSDLAnhToán 1 |	689 |

Chuyển về dạng chuẩn 1NF:

| MASV	| HOTEN	| DIACHI	| MAMON	| TENMON	| TENGV	| PHONG |	DIEM | 
| ------ | ----- | ------- | ------ | --------- | ----- | ------ | ----- |
| A01	| Lê Na |	12 Thái Hà |	M01	| CSDL	| Mai	| P401	| 8 |
| A01	| Lê Na |  	12 Thái Hà |	M02	| Anh	| Hương	| P405	| 9 |
| A02	| Trần An |	56 Mã Mây |	M01	| CSDL | 	Mai	| P401	| 8 |
| A03	| Hà Nam | 	24 Cầu Gỗ |	M01	| CSDL	| Mai	| P401	| 6 |
| A03	| Hà Nam |	24 Cầu Gỗ |	M02	| Anh	 | Hương	| P405	| 8 |
| A03	| Hà Nam |	24 Cầu Gỗ |	M03	| Toán 1	| Hoa	| P406	| 9 |


<a name="4.2">

**Dạng chuẩn 2NF**

Một quan hệ ở dạng chuẩn 2NF nếu quan hệ đó:
* Là 1NF.
* Các thuộc tính không khóa phải phụ thuộc hàm đầy đủ vào khóa chính.

Một quan hệ ở dạng chuẩn 2NF nếu thỏa mãn 1 trong các điều kiện sau:
* Khóa chính chỉ gồm một thuộc tính
* Bảng không có các thuộc tính không khóa
* Tất cả các thuộc tính không khóa phụ thuộc hoàn toàn vào các thuộc tính khóa chính.

<a name="4.3"> 

**Dạng chuẩn 3NF** 

Một quan hệ ở dạng chuẩn 3NF nếu quan hệ đó:
* Là 2NF
* Các thuộc tính không khóa phải phụ thuộc trực tiếp vào khóa chính

<a name="5">

## Mối quan hệ giữa các bảng

`Quan hệ 1-1` là quan hệ mà một bản ghi của bảng A quan hệ với duy nhất với một bản ghi của bảng B và ngược lại.

`Quan hệ 1-n` là quan hệ một bản ghi của bảng A quan hệ với nhiều bản ghi của bảng B.

`Quan hệ n-n` là quan hệ nhiều bản ghi của bảng A quan hệ với nhiều bản ghi của bảng B.

Trên thực tế quan hệ `n-n` ít được sử dụng người ta thường tách nó ra thành các quan hệ `1-n`