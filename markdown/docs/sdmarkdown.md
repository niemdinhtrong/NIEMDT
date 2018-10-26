# Cách sử dụng ngôn ngữ Markdown

## Mục lục

[1.Phần tiêu đề]
[2.Nhấn mạnh]
[3.Danh sách]
[4.Chèn link]
[5.Chèn ảnh]
[6.Đánh dấu code và cú pháp]
[7.Bảng]
[8.Tạo dòng chú thích]
[9.Tạo dấu gạch ngang]


# 1.Phần tiêu đề

```
# H1
```

# H1

``` 
## H2

```
## H2

```
### H3

```
### H3

Tương tự như vậy các tiêu đề cấp sau thì thêm nhiều dấu `#` hơn

Cách khác để viết tiêu đề

```
Ví dụ 1
=======
```

Ví dụ 1
=======

```
Ví dụ 2
-------
```

Ví dụ 2
-------

# 2.Nhấn mạnh

Có nhiều cách để nhấn mạnh

- In nghiêng ta dùng `* Từ cần in nghiêng *` nó sẽ ra được * Từ cần in nghiêng *

- Để in đậm ta dùng `** Từ cần in đậm **` nó sẽ được ** Từ cần in đậm **

- Để gạch thêm nhấn mạnh bằng cách gạch ngang chữ ta dùng ` ~~ Từ gạch ~~` sẽ ra ~~ Từ gạch ~~

# 3.Danh sách

Thực hiện

```

1. Mục 1

2. Mục 2

 * Muc 2.1
 
 * Mục 2.2
     
     - Mục 2.2.1

3. Mục 3
```

thì kết quả sẽ là 

1. Mục 1

2. Mục 2

 * Muc 2.1
 
 * Mục 2.2
     
     - Mục 2.2.1

3. Mục 3

`chú ý` là các mục cùng cấp thì đề đầu dàng thẳng hàng nhau. Nếu là thư mục con thì lùi vào trong.

# 4.Chèn link

Có nhiều cách để chèn link

`[ link đến google](https://www.google.com)`

[ link đến google](https://www.google.com)

nếu không muốn để đường link ở sau

```
[link][mô tả link]

[mô tả link]: https://www.google.com
```

Phần mô tả ta cũng có thể đặt là số

Ta cũng có thể đặt link trực tiếp luôn 

`https://www.google.com`

https://www.google.com

# 5.Chèn ảnh

Chèn ảnh ta có 2 cách như cách chèn link đầu tiên

`![](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "phần mô tả khi trỏ vào ảnh")`

![](![](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "phần mô tả khi trỏ vào ảnh")

```
![](logo]

[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "phần mô tả khi trỏ vào ảnh"
```

![](logo]

[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "phần mô tả khi trỏ vào ảnh"

# 6.Đánh dấu code và cú pháp

Để bo chữ ta dùng kí tự ` ` chữ cần bo` `

` chữ cần bo`

Để bo cả một đoạn

ta dùng ` ``` `

```

```
đoạn 1

đoạn 2
```
```

```
đoạn 1

đoạn 2
```

Markdown cũng hỗ trợ tạo màu các cú pháp trong một số ngôn ngữ 

```
```javascript
var s = "JavaScript syntax highlighting";
alert(s);
```
```

```javascript
var s = "JavaScript syntax highlighting";
alert(s);
```

# 7.Bảng

```
| dòng | cột 1 | cột 2 | Cột 3 |
| ----- |-----|------|-----|
|dòng 1 | 1 | 2 | 3 |
|Dòng 2 | 4 | 5 | 6 |
```

| dòng | cột 1 | cột 2 | Cột 3 |
| ----- |-----|------|-----|
|dòng 1 | 1 | 2 | 3 |
|Dòng 2 | 4 | 5 | 6 |

# 8.Tạo dòng chú thích

```

Cái này có nghĩa là:

> ý nghĩa 1

> ý nghĩa 2
```

Cái này có nghĩa là:

> ý nghĩa 1

> ý nghĩa 2

# 9.Tạo dấu gạch ngang

```

Dòng 1...

----

Dòng 2

***

Dòng 3
```
Dòng 1...

----

Dòng 2

***

Dòng 3



