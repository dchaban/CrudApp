CRUD (create, read, update, delete).
Стандартное crud приложение, которое отображает список всех юзеров в базе (с пейджингом).
С возможностью их удаления, редактирования, добавления новых и поиска по уже существующим.
Поиск осуществляется по полю name, так же реализован фильтр администраторов.
Запрос для создания базы данных, таблицы и заполнения ее тестовыми данными осуществляется 
с помощью sql запроса из файла: database.sql.
После деплоя в Tomcat приложение будет доступно по адресу: http://localhost:8080/.
Используемые технологии:
Maven (для сборки проекта)
- Maven
- Spring
- Hibernate
- Tomcat
- Mysql.