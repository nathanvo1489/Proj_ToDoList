# nhập dữ liệu nháp trực tiếp trong terminal với các lệnh cơ bản sau:

# Bước 1: Mở shell MongoDB với username & pass đã khởi tạo container
bash
```
docker exec -it mongodb mongosh -u root -p 12345 --authenticationDatabase admin
```
# Bước 2: Chọn database
```
use [DATABASE_NAME]
```
# Bước 3: Tạo collection và thêm dữ liệu
Thêm nhiều bản ghi cùng lúc:
```
db.users.insertMany([{ "name": "Nhat","email": "nhatvo@gmail.com","password": "Nhat123" },{ "name": "Ken","email": "kennedy@gmail.com","password": "Ken123" }])

test in localhost React frontend
{ "name": "Jon","email": "jonnathan@gmail.com","password": "Jon123" }
```
# Bước 4: Kiểm tra dữ liệu vừa nhập
```
db.users.find()
```
# Xóa data
db.users.deleteMany([{ name: "Nhat" },{ name: "Ken" }])