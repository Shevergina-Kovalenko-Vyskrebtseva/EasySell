<#import "block/template.ftlh" as t>
<@t.template user!>
    <h1 style="text-align: center">Авторизация</h1>
    <hr>
    <form action="/login" method="post">
        <#if (message)??>
            <div class="alert alert-info">
                ${message}
            </div>
        </#if>
        <div class="form-group">
            <label for="email">Электронная почта</label>
            <input type="email" class="form-control" id="email" name="username">
        </div>
        <div class="form-group">
            <label for="password">Пароль</label>
            <input type="password" class="form-control " id="password" name="password">
        </div>
        <button type="submit" style="width: 100%" class="btn btn-dark">Войти</button>
    </form>
    <hr>
    <h2>Нет аккаунта EasySell? <a href="/registration">Зарегистрируйся!</a></h2>
</@t.template>
