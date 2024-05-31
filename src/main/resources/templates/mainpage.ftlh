<!doctype html>
<html lang="ru">
<head>
    <title>EasySell</title>
</head>
<body>
<H1>EasySell </H1><hr>
<#if user.email??>
    <h3>Имя пользователя:<i>${user.name}</i></h3>
    <form action="/logout" method="post">
        <input type="submit" value="Выйти"/>
    </form>
    <#if user.isAdmin()>
        <a href="/admin">Панель администратора</a>
    </#if>
    <#else>
        <a href="/login">Войти</a><hr>
</#if>

<H4>Товары</H4>
<form action="/" method="get">
    Поиск по названию: <input type="text" name="title"><br>
    <input type="submit" value="Поиск"/>
</form>
<#list products as product>
    <div>
        <p><b>${product.title}</b> ${product.price} рублей | <a href="/product/${product.id}">Подробнее...</a></p>
    </div>
<#else>
    <H3>Товаров нет</H3>
</#list>
<#if user.email??>
<hr>
<H3>Добавить товар</H3>
<form action="/product/create" method="post" enctype="multipart/form-data">
    Название товара: <input type="text" name="title"/><br><br>
    Описание товара: <input type="text" name="description"/><br><br>
    Цена: <input type="number" name="price"/><br><br>
    Город: <input type="text" name="city"/><br><br>
    Первая фотография: <input type="file" name="file1"/><br><br>
    Вторая фотография: <input type="file" name="file2"/><br><br>
    Третья фотография: <input type="file" name="file3"/><br><br>
    <input type="submit" value="Добавить товар"/>
</form>
</#if>
</body>
</html>