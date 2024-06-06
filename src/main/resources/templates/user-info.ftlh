<#import "block/template.ftlh" as t>
<@t.template userByPrincipal>
    <h1 style="text-align: center">Информация о пользователе</h1>
    <hr>
    <div style="text-align: center">
        <img src="/static/images/avatar.png"
             style="border:2px solid black; border-radius: 20px" height="120">
        <br>
        <br>
        <h2>${user.name}</h2>
        <br>
        Номер телефона: <b>${user.numberPhone}</b>
    </div>
    <br>
    <hr>
    <h1 style="text-align: center">Товары пользователя ${user.name}</h1>
    <br>
    <div class="row">
        <#list products as product>
            <div class="col-md-4 d-flex align-items-stretch">
                <div class="card text-white bg-dark my-3 product">
                    <a href="/product/${product.id}" class="product-link text-white">
                        <img src="/images/${product.previewImageId}" class="card-img-top">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title">${product.title}</h5>
                            <p class="card-text mt-auto">${product.price} ₽</p>
                        </div>
                        <div class="card-footer">
                            ${product.city}
                        </div>
                    </a>
                </div>
            </div>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
</@t.template>