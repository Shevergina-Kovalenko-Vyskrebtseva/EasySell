<!doctype html>
<html lang="ru">
<head>
    <title>EasySell</title>
</head>
<body>
<H1>EasySell</H1><hr>
<H4>Подробная информация о товаре</H4>
<#list images as img>
    <img src ="/images/${img.id}" height="60px"/><br><br>
</#list>
<b>Название товара: </b>${product.title}<br>
<b>Описание товара: </b>${product.description}<br>
<b>Цена товара: </b>${product.price}<br>
<b>Город: </b>${product.city}<br>
<b>Автор: </b><a href="/user/${product.user.id}">${product.user.name}</a><br>
</body>
</html>