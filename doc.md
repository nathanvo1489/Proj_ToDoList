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

# JENKINS

sudo systemctl status jenkins
sudo systemctl start jenkins
sudo systemctl stop jenkins

# xem password then unlock Jenkins
sudo cat /ver/lib/jenkins/secrets/initialAdminPassword

#1- New Item for DockerHub example
Pipeline:
- Discard old builds -> max 5 keeps
- Dont allow concurrent build
- Pipeline speed: performance
- Trigger: GitHub hook

# TERRAFORM CLI
```bash
# must run in the parent folder of 'terraform'
docker run --name ubuntu-terraform -d -it -v ./terraform:/root/terraform ubuntu:latest

# open local terminal and login terraform ubuntu with terminal
docker exec -it ubuntu-terraform bash

# install terraform into /usr/local/bin/
mv terraform /usr/local/bin/

# install aws CLI, but need install curl first
apt update && apt install -y curl unzip
# goto folder 'aws' and run
bash install.sh --system
# install gnupg package for signature clarification of using aws cli
apt-get update && apt-get install -y gnupg

# check version
terraform --version
aws --version

aws configure

# install less to show json format
apt update && apt install -y less
aws sts get-caller-identity

# check syntax of the script
terraform fmt
terraform init
terraform validate

# start creating EC2 instance
terraform apply

# compare the changes
terraform plan

terraform destroy
```

# ANSIBLE CLI
```bash
docker run --name ubuntu-ansible -d -it -v ./ansible:/root/ansible ubuntu:latest
docker exec -it ubuntu-ansible bash

apt update
apt install software-properties-common
add-apt-repository --yes --update ppa:ansible/ansible
apt install ansible

ansible --version

# check if ansible can catch [myhosts]
ansible-inventory -i inventory.ini --list

# PING
ansible myhosts -m ping -i inventory.ini
ansible jenkins_server -m ping -i inventory.ini

ssh -i "devops.pem" ubuntu@54.255.151.147

ansible-playbook -i inventory.ini playbook-install-docker.yml
ansible-playbook -i inventory.ini playbook-install-nginx.yml
ansible-playbook -i inventory.ini playbook-install-jenkins.yml

```