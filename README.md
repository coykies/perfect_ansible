
# Perfect_ansible
## ⚠️ Важно
**Данный плейбук протестирован и корректно работает на процессорах AMD64**




## Подготовка к использованию (опционально)

Устанавливаем Ansible
```bash
# Debian/Ubuntu
sudo apt install ansible

# macOS
brew install ansible
```
Установливаем python на всех хостах 
```bash
apt update && apt install -y python3
```
Если используется ARM процессор рекомендуется проверять плейбук на docker контейнерах
```bash
# Debian/Ubuntu
sudo apt update
sudo apt install docker.io

# macOS
brew install docker
```
Для тестов можно создать собственный контейнер/виртуальную машину на базе Debian 11 или воспользоваться скриптом docker_ansible-test.sh

```bash
perfect-ansible/
├── .ansible/             
├── docker_ansible-test.sh              
├── inventory.ini      
├── nginx.conf               
├── playbook.yml      
├── README.md           
└── secret.yml                
```
Добавляем права на выполнение файлу и запускаем
```bash
chmod +x docker_ansible-test.sh
./docker_ansible-test.sh
```
Контейнер ansible_test запущен
```bash
CONTAINER ID   IMAGE       COMMAND               CREATED       STATUS       PORTS     NAMES
87b74f80fdcc   debian:11   "tail -f /dev/null"   9 hours ago   Up 9 hours             ansible-test
```

## Запуск

Клонируем проект

```bash
  git clone https://github.com/coykies/perfect_ansible
```

Переходим в директорию

```bash
  cd perfect_ansible
```

Заполням инвентори необходимыми хостами

```bash
  vim inventory.ini
```

Проверка подключения к хостам

```bash
  ansible all -i inventory -m ping
```
Примерный ответа 

```bash
  ansible-test | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```
Плейбук использует Ansible vault для хранилища секретов

**в нашем случае название репозитория ${наш пароль}_ansible**
```bash
#посмотреть содержание secret.yml
ansible-vault view secrets.yml
#редактировать secret.yml
ansible-vault edit secrets.yml
```

Запускаем плейбук 
```bash
#название репозитория - ${наш пароль}_ansible
ansible-playbook -i inventory.ini playbook.yml --ask-vault-pass  
```


## Roadmap

- Внедрение Ansible ролей в плейбук

- Адаптация под другие дистрибутивы Linux 


## Authors

- [@coykies](https://github.com/coykies)


