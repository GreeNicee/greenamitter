<#import "parts/common.ftl" as c>

<@c.page>
<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" value="${filter?ifExists}" placeholder="Search by Tag" class="form-control mr-2">
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
    </div>
</div>

<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Add new message
</a>

<div class="collapse" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post"enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" name="text" class="form-control" placeholder="Введите сообщение"/>
            </div>
            <div class="form-group">
                <input type="text" name="tag" class="form-control" placeholder="Тэг"/>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Add</button>
            </div>
        </form>
    </div>
</div>
<div class="card-columns">
    <#list messages as message>
    <div class="card my-3">
            <#if message.filename??>
            <img src="/img/${message.filename}" class="card-img-top">
        </#if>
        <!--<b>${message.id}</b>-->
        <div class="m-2">
            <span>${message.text}</span>
            <i><strong>${message.tag}</strong></i>
        </div>
        <div class="card-footer text-muted">
            <strong>${message.authorName}</strong>
        </div>
    </div>
    <#else>
    No messages
    </#list>
</div>
</@c.page>