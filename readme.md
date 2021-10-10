# Запуск

```
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python main.py
```

# Инструкция
## Postgres

Создаем *volume* для *postgres*
```
sudo docker volume create postgres-data
```

Запуск *postgres*
```
sudo docker run \
-e POSTGRES_USER=forum_user \
-e POSTGRES_PASSWORD=forum_password \
-p 5432:5432 \
--name postgres \
--mount source=postgres-data,target=/var/lib/postgresql  \
-d postgres:11
```

Создадим базу данных и дадим все права на нее нашему пользователю:
```
CREATE DATABASE forum;
GRANT ALL PRIVILEGES ON DATABASE forum TO forum_user;
```

## Генерация миграций
```
alembic init migrations

export PYTHONPATH=. 
alembic revision -m 'create table Message' --autogenerate
```