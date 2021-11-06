django是自带了一个后台管理页面，非常方便，对我们快速开发和验证有非常大的帮助。



## 创建管理员账号

```
python manage.py createsuperuser
```

根据提示来



## 注册应用模型到后台

django默认安装了admin这个应用，且注册了路由。我们启动服务器，访问http://127.0.0.1:8000/admin/

我们输入密码进入到后台之后，会发现整个后台可编辑内容只有个`用户和组`，这是由`auth`应用提供的、django的认证框架。

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/django%20admin%20default.png)

并没有我们的应用模型，我们需要把它添加到后台索引去。告诉管理员，问题 `Question` 对象需要一个后台接口。

编辑应用的`admin.py`，把model导进来

```python
from django.contrib import admin

from .models import Question

admin.site.register(Question)
```



![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/django%20admin%20register%20model.png)



然后我们可以在管理后台删除添加编辑保存应用模型对应的数据库表中的数据，真的超级方便

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/django%20admin%20edit.png)