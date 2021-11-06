## Django是如何处理请求的

Django 项目目录下的`settings.py `有个`ROOT_URLCONF`的变量，它的值默认是`<项目名>.urls`，对应的是项目文件夹的urls.py。Django会加载该模块并寻找可用的 `urlpatterns`。



Django会顺序遍历整个`urlpatterns`，一旦请求成功匹配到一个路径对上的`urlpattern`，则会调用这个`urlpattern`对应的视图函数



## 最常见的urlpattern配置



django的入门demo里面[编写第一个django应用](https://docs.djangoproject.com/zh-hans/3.2/intro/tutorial01/)，新建了一个polls应用，polls应用的views.py里面有个index函数。

它的url配置比较经典，一般我们自己写项目可以仿照这样来

### 应用下新建urls.py

```python
from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
]
```

path的第一个参数是路由，我们通过`http://127.0.0.1:8000/polls/`访问。如果是`path('test', views.index)`，我们就需要通过`http://127.0.0.1:8000/polls/test`访问





name参数是比较高阶的用法了，指定namespace

### 项目的urls.py中导入

```
path('polls/', include('polls.urls'))
```

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/django%20project%20default%20url.png)

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/django%20project%20url%20include.png)
