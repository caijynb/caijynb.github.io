## 创建应用

项目目录下

```
python3 manage.py start <应用名>
```



## 应用结构

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/django%20app.png)

\__init__.py: 应用的初始化文件

admin.py: 当前应用后台管理

apps.py: 当前应用的配置信息，在Django 1.9版本以后自动生成，一般情况下无需修改

models.py: 定义数据库的映射类，每个类可以关联一张数据表，实现数据持久化，即MTV中的模型（model)

tests.py: 自动化测试的模块，用于实现单元测试

views.py: 视图文件，处理功能的业务逻辑，即MTV中的视图（views)





## 注册应用

Django的项目settings.py头部有一个 [`INSTALLED_APPS`](https://docs.djangoproject.com/zh-hans/3.2/ref/settings/#std:setting-INSTALLED_APPS) 设置项，表示在 Django 项目中所有要被启用的应用程序。django默认自带了一些应用：

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/default%20apps.png)

这些应用视情况决定是否要保留。

我们自己新建的应用，要加到这个列表中去。直接加一个应用名就好

