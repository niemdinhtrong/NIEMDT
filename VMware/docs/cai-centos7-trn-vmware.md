# Cài centOS 7 trên VMware worktation

Trước tiên cần download file centos 7 

Có thể [vào đây](http://isoredirect.centos.org/centos/7/isos/x86_64/CentOS-7-x86_64-Minimal-1804.iso) tìm bản phù hợp để download

Mở VMware nhấn vào ` create a new virtual machine` để bắt đầu 

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/VMware/images/c1.png)

Chọn `Typical` với tùy chọn `Typical` cho phép ta tạo máy ảo với các bước đơn giản hơn. Sau
 đó nhấn `Next`
 
 ![](https://github.com/niemdinhtrong/NIEMDT/blob/master/VMware/images/c2.png)
 
 Nhấn `Browse` sau đó tìm đúng file vừa tải về.
Sau đó nhấn `Next`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/VMware/images/c3.png)

Ta đặt tên máy ảo ở vị trí name sau đó chọn `Browse` để chọn vị trí lưu máy ảo trên máy thật của 
chúng ta. Sau đó nhấn `Next`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/VMware/images/c4.png)

Chọn kích thước max mà ổ đĩa ảo có thể dùng ( ở đây đang để lad 20G) và chọn ` Split virtual disk into multiple files`
tùy chọn này việc cài máy sẽ chia thành nhiều files giống như các files trong ổ C khi ta cài windows. Nhấn `Next` để tiếp tục

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/VMware/images/c5.png)

Chọn `Customize Hardware` để tùy chỉnh phần cứng 

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/VMware/images/c6.png)

Ở đây ta có thể chọn các thiết bị ở cột bên trái để tùy chỉnh sao cho phù hợp với mục đích 
sử dụng máy ảo của mình. Nhưng ở đây ta thường thay đổi 3 thông số là `Memory` `Processors` và 
`Network Adapter`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/VMware/images/c6.1.png)

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/VMware/images/c6.2.png)

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/VMware/images/c6.3.png)

Ở đây có 3 cách chọn kiểu kết nối card mạng cho máy ảo là `Bridged` `NAT` và `Host-only`

 * `Bridged` máy ảo sẽ được cấp 1 địa chỉ có cùng subnet với máy thật.
 
 * `NAT` sẽ có 1 card mạng ảo cho máy ảo này và nó phải thực hiện kỹ thuật `NAT` để kết nối ra bên ngoài`
 
 * `Host-only` máy ảo chỉ có thể giao tiếp với máy thật đang mà nó đang chạy trên đó chứ ko thể truy cập ra ngoài mạng.
 
Khi đã thiết lập xong phàn cứng ta chọn `Close` để tiếp tục

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/VMware/images/c6.4.png)

Chọn `Finish` để bắt đầu cài đặt

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/VMware/images/c6.5.png)

Đợi hệ thống cài đặt

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/VMware/images/c7.png)

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/VMware/images/c7.1.png)

Chọn ngôn ngữ cho máy( chú ý chọn *United States* để ko bị lỗi khi gõ phím). Chọn `Continue` để qua bước tiếp theo:

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/VMware/images/c8.png)

Chọn thành phố và cài ngày giờ. Chọn xong nhấn `Done` để qua bước tiếp theo

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/VMware/images/c9.1.png)

Bật kết nối mạng cho máy. ở đây địa chỉ IP đã được cấp động. Nếu muốn thay đổi gì thì nhấn vào `Configure`. Nếu không thay đổi gì nhấn `Done` để 
tiếp tục

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/VMware/images/c10.png)

Đợi đến khi hiện lên `Begin Install` thì nhấn vào để qua bước tiếp theo

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/VMware/images/c12.png)

Chọn `ROOT PASSWORD` để đặt mật khẩu cho tài khoản root.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/VMware/images/c14.png)

Nhập mật khẩu cho tài khoản `root`. Chú ý ghi nhớ mật khẩu này. Nhập xong nhấn `Done` để sang bước tiếp theo

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/VMware/images/c15.png)

Bạn cũng có thể tạo thêm tài khoản user cho máy bằng cách nhấn vào `USER CREATION` 
việc tạo này ta có thể để sau khi đã tạo máy thành công. Nhấn `Finish configuration` để hoàn tất việc cài đặt

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/VMware/images/c16.png)

Nhấn `Reboot` để khởi động máy ảo vừa tạo

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/VMware/images/c18.png)

Ta đã tạo máy thành công

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/VMware/images/c19.png)













