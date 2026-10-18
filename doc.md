# nhập dữ liệu nháp trực tiếp trong terminal với các lệnh cơ bản sau:

# Bước 1: Mở shell MongoDB với username & pass đã khởi tạo container
bash
```
docker exec -it mongodb mongosh -u root -p 12345 --authenticationDatabase admin

mongodb://root:12345@localhost:27017/mongo_data?authSource=admin
```
# Bước 2: Chọn database
```
use [DATABASE_NAME]
```
# Bước 3: Tạo collection và thêm dữ liệu
Thêm nhiều bản ghi cùng lúc:
```
db.users.insertMany([{ name: "Nhat", age: 32 },{ name: "Ha", age: 30 },{ name: "Ken", age: 3 }])
```
# Bước 4: Kiểm tra dữ liệu vừa nhập
```
db.users.find()
```
