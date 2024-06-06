<#import "block/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Поиск товаров</h1><hr>
    <form method="get" action="/">
        <div class="form-row">
            <div class="form-group col-md-2">
                <label for="searchCity">Город</label>
                <select id="searchCity" name="searchCity" <#if searchCity??>value="${searchCity}"</#if> class="form-control">
                    <option value="">Город не выбран</option>
                    <option value="Барнаул">Барнаул</option>
                    <option value="Новоалтайск">Новоалтайск</option>
                    <option value="Рубцовск">Рубцовск</option>
                    <option value="Новосибирск">Новосибирск</option>
                </select>
            </div>
            <div class="form-group col-md-10">
                <label for="searchWord">Поиск по объявлениям</label>
                <input type="text" id="searchWord" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> class="form-control" >
            </div>
            <button style="width: 100%" type="submit" class="btn btn-dark">Поиск</button>
        </div>
    </form>
    <hr>
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