<#import "block/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Мои товары</h1>
    <hr>
    <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
       data-toggle="collapse" href="#collapseExample" role="button"
       aria-expanded="true" aria-controls="collapseExample">
        Добавить новый товар
    </a>
    <div class="collapse mb-3" id="collapseExample" style="">
        <form action="/product/create" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="productName">Название товара</label>
                <input type="text" required class="form-control"
                       id="productName" name="title">
            </div>
            <div class="form-group">
                <label for="price">Цена товара</label>
                <div class="input-group mb-3">
                    <input type="number" required class="form-control" id="price" name="price">
                    <div class="input-group-append">
                        <span class="input-group-text">₽</span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="searchCity">Город</label>
                <select id="searchCity" required name="city" class="form-control">
                    <option value="">Город не выбран</option>
                    <option value="Барнаул">Барнаул</option>
                    <option value="Новоалтайск">Новоалтайск</option>
                    <option value="Рубцовск">Рубцовск</option>
                    <option value="Новосибирск">Новосибирск</option>
                </select>
            </div>
            <div class="form-group">
                <label for="description">Описание товара</label>
                <textarea required class="form-control" id="description" name="description"></textarea>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input required type="file" class="custom-file-input" name="file1" id="file1">
                    <label class="custom-file-label" for="file1">Первая фотография к товару</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" class="custom-file-input" name="file2" id="file2">
                    <label class="custom-file-label" for="file2">Вторая фотография к товару</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" class="custom-file-input" name="file3" id="file3">
                    <label class="custom-file-label" for="file3">Третья фотография к товару</label>
                </div>
            </div>
            <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
        </form>
    </div>
    <div class="row">
        <#list products as product>
            <div class="col-md-4 d-flex align-items-stretch">
                <div class="card text-white bg-dark my-3 product">
                    <a href="/product/${product.id}" class="product-link text-white">
                        <div class="card-top">
                            <form action="/product/delete/${product.id}" method="post">
                                <button type="submit" class="btn btn-danger m-3">
                                    Удалить
                                </button>
                            </form>
                        </div>
                        <img src="/images/${product.previewImageId}"
                             class="card-img-top">
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