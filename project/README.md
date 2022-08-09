# Информация по проекту

[Дизайн](https://www.figma.com/file/DskQkoBqXewHFzyqlKkao3/Surf-education-iOS?node-id=9%3A8467)

### Сервер

Base Url: https://pictures.chronicker.fun/api
<br>Сваггер спецификация: https://pictures.chronicker.fun/

**Аккаунты:**
Доступны все картинки: +71234567890 / qwerty
<br>Часть картинок: +79876543219 / qwerty
<br>Без картинок: +78005003030 / qwerty

### Общая логика по выполнению запросов:

Все запросы, кроме **auth/login** требуют токен авторизации. Передавать в хедерах "Authorization": "Token $token".
<br>Где $token - это токен, который вы получили при авторизации, в запросе **auth/login.**

Вечный токен, чтобы обойти авторизацию: 
595d9f58b8ac34689b1326e2cf4ef803882995c267a00ce34c6220f4a6d8ed6a

или

7af13ab633789e2601529cb14782c7e114af837365ad922b2bb2b09f4b8d72b9
