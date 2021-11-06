## 创建项目

终端下运行

```
django-admin startproject <项目名>
```



## 项目结构

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/django%20project.png)

asgi.py是Django 3.0的新特性，是wsgi.py的功能拓展。异步网关协议接口，不仅兼容WSGI的原有的模式，还增加了对websocket协议的支持。



## 项目启动

完成项目和应用创建后可以启动

```
python3 manage.py runserver
```

默认端口是8000，浏览器打开`http://127.0.0.1:8000/`访问，可以在runserver后面输别的端口。

```
python3 manage.py runserver 8001
python3 manage.py runserver 0:8001
# 0:8001 0是0.0.0.0的缩写，这样可以公网访问
```



![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/django%20runserver.png)







## settings.py修改

```
LANGUAGE_CODE = 'zh-hans'
TIME_ZONE = 'Asia/Shanghai'
```

`USE_TZ`按需更改，默认是`True`的，这种情况下Django还是会使用服务器的系统时间。如果我们在国外的VPS上部署，可以考虑将`USE_TZ`改为`False`或是将服务器的系统时间改成上海的。





另外，因为我现在都在code server上远程写代码了，所以为了调试，势必要用`python3 manage.py runserver 0:8000`的方式公网启动项目调试 。为此需要在settings.py下的ALLOWED_HOSTS 加上公网ip，不然访问不了。







# 使用pycharm新建项目

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/new peoject.png)

就不需要`django-admin startproject <项目名>`，`python3 start <应用名>`,`mkdir templates`

