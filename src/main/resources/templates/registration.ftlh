<#import "block/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Регистрация</h1>
    <hr>
    <form action="/registration" method="post">
        <#if (errorMessage)??>
            <div class="alert alert-danger">
                ${errorMessage}
            </div>
        </#if>
        <div class="form-group">
            <label for="name">Имя пользователя</label>
            <input type="text" class="form-control" required id="name" name="name">
        </div>
        <div class="form-group">
            <label for="email">Электронная почта</label>
            <input type="email" class="form-control" id="email" required name="email">
        </div>
        <div class="form-group">
            <label for="numberPhone">Номер телефона</label>
            <input type="text" class="form-control" id="numberPhone" required name="numberPhone" placeholder="+7(___)___-____">
        </div>
        <div class="form-group">
            <label for="password">Пароль</label>
            <input type="password" class="form-control" id="password" required name="password">
        </div>
        <button type="submit" style="width: 100%" class="btn btn-dark" data-toggle="modal" data-target="#exampleModal">
            Зарегистрироваться
        </button>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Минуточку...</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Для завершения регистрации необходимо заполнить все поля и подтвердить электронную почту
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-dark" data-dismiss="modal">Ок</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</@t.template>
