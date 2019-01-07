## Tìm hiểu cơ chế snapshot trong KVM

Snapshot là ghi lại tất cả trạng thái, tất cả những gì liên quan đến máy ảo ở một thời điểm nhất định. Ta có thể hình dung các dữ liệu này gom lại thành một khối và khi ta tạo một bản snapshot mới thì các dữ lệu cũ được đóng lại và chỉ có thể đọc với khối đó và sẽ có một khối mới nối tiếp với khối cũ. Và bây giờ tất cả trạng thái của VM nếu thay đổi gì thì sẽ được ghi lại trên khối mới mày. Nếu VM cần sử dụng một dữ liệu nào đó trong khối cũ thì nó sẽ đọc ở trong khối đó còn nếu thay đổi gì thì nó không được thay đổi trực tiếp trên khối cũ đó mà được ghi trên khối mới nhất.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/snapshot/1.png)

Với mỗi một khối như thế là một bản snapshot. Khi muốn sử dụng lại bản snapshot nào đó thì VM sẽ tiến hành copy cái khối tương ứng với bản snapshot đó vào khối đang sử dụng.

![](https://github.com/niemdinhtrong/NIEMDT/blob/master/KVM/images/snapshot/2.png)