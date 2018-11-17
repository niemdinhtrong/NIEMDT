# LVM linear and striped
Trước tiên cần hiểu LVM linear và striped là gì. Hiểu đơn giản nó chỉ là 2 cách ghi dữ liệu trên trên các Physical volume. Như đã tìm hiểu từ trước Volume group được hình thành bằng các gom các Physical volume lại với nhau. Trong 1 Volume group ta có thể tạo nhiều Logical volume với LVM linear và striped ta có thể gom phần còn trống lại để thành logical volume dạng `linear` hoặc `striped`. Như trong phần trước một logical volume vó thể gồm các Physical volume nằm trong đó như vậy ta không biết thực chất dữ liệu được ghi vào như thế nào(dữ liệu nằm như thế nào trên các Physical volume). Thực chất `linear` và `stripad` là 2 cách ghi dữ liệu trong LVM

Để dễ hình dung ta coi 1 máy có 5 ổ cứng mỗi ổ 500G và ta chỉ tạo ra 5 physical volume. Ta gom 5 physical volume này lại thành một volume group. Và ta chỉ tạo ra duy nhất 1 logical volume từ group volume này. Ta tiến hành `mount` nó vào một thư mục và có thể dùng được. Như vậy thư mục đó sẽ bao gồm cả 5 disk ta tạm gọi là `disk1` `disk2` `disk3` `disk4` và `disk5`.
 * `Linear` nếu ta có dữ liệu 700G muốn lưu vào thư mục vừa rồi thì nó sẽ ghi như sau. Nó sẽ tiến hành ghi dữ liệu vào `disk1` đến khi dung lượng `fisk1` hết nói sẽ tiếp tục ghi sang `disk2` và cứ tiếp tục như thế. Như ví dụ trên nó sẽ ghi vào `disk1` 500G và `disk2` 200G.
 * `Striped`với kiểu này dữ liệu sẽ được chia đều ra các disk cho dù dữ liệu đó chỉ có thể ghi trọn vẹn trong 1 disk. Vd ta có dữ liệu 100G muốn lưu vào thư mục vừa rồi thì nó sẽ lưu vào `disk1` 1G(dung lượng này có thể tùy chỉnh trong lúc tạo striped logical volume) `disk2` 1G nó cứ làm như thế đến `disk5` 1G và nó lại lặp lại `disk1` 1G nó cứ ghi như thế đến khi hết 100G dữ liệu kia thì thôi.

## Cách cài đặt 
### LVM linear
Để tạo được `linear logical volume` trước tiên ta phải có volume group và nó phải còn dung lượng còn trống mà chưa cấp cho logical volume khác.
Lệnh `lvcreate --extents N%FREE --name tên_logical tên_group`
Trong đó: 
 *  `N` là % dung lượng ta định lấy ra trong số dung lượng Volume group còn trống.
 * `tên_logical` là tên của logical volume ta định tạo
 * `tên_group` là tên của goup volume mà nó nằm trong

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/li1.png)

Sau khi tạo xong ta co thể dùng lệnh `lvs` hoặc `lvdisplay` để kiểm tra

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/li2.png)

Để sử dụng được ta cần phải format và mount nó vào thư mục để sử dụng. 

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/li3.png)

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/li4.png)

Bây giờ ta đã có thể sử dụng được.
Ta có thể thông tin của các logical volume và xem nó thuộc kiểu nào. Lệnh `vls --segment`

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/li5.png)

### LVM striped
Cũng như `linear` để tạo `striped logical volume` trước tiên ta  cũng phải có volume group và nó phải còn dung lượng còn trống mà chưa cấp cho logical volume khác.
Lệnh: `lvcreate --extents N%FREE --stripes X --stripesize Y --name tên_logical tên_group`
Trong đó: 
 * `N` là % dung lượng ta định lấy ra trong số dung lượng Volume group còn trống.
 * `X` là số physical volume  ta định lấy
 * `Y` là dung lượng 1 lần nó ghi trên 1 physical volume(giống vd bên trên)

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/li6.png)

Bây giờ ta chỉ cần format và mount và sử dụng

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/li7.png)

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/linux/images/li8.png)
