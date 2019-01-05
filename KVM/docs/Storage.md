## Tìm hiểu cơ chế lưu trữ Thin-Thick

### 1. Thick
Với cơ chế này khi ta tạo một disk ảo cho VM nó sẽ nhận nguyên dung lượng disk đó làm disk của nó dù cho nó chưa sử dụng hết dung lượng disk đó. Thick có 2 loại là:
 * `Thick Lazy` khi tạo một disk cho VM nó sẽ ánh xạ đến một phân vùng trên disk thật. Nó nhận đủ dung lượng disk mà ta tạo cho VM và nó sẽ không xóa dữ liệu cũ trên disk (nếu có) khi chúng ta ghi cái ghì lên đó thì nó mới xóa dữ liệu đó đi. Chính vì vậy nên việc tạo đĩa ảo sẽ rất nhanh nhưng sẽ mất nhiều thời gian cho lần ghi đầu tiên do phải xóa dữ liệu cũ(nếu có)
 * `Thick Eager` cũng gần giống như `thick lazy` có cũng nhận toàn bộ dung lượng mà ta tạo disk cho VM. Nó sẽ ghi toàn bộ bit 0 lên phần dung lượng chưa được sử dụng của disk ảo(giống như ta tạo file với câu lệnh `dd`). Vì vậy khi tạo disk cho VM ở kiểu này sẽ lâu hơn so với `thick lazy` nhưng với lần ghi đầu tiên sẽ nhanh hơn

![]()

Như ta thấy thì nó sẽ rất lãng phí disk. Ví dụ ta có 