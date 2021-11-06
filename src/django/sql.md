## 数据库配置

Django的数据库配置在项目的`settings.py`下的`DATABASES`选项设置，默认使用的是本地的SQLlite

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```



先`python3 manage.py migrate`把django自带应用的表都给生成了

再开始给我们自行创建的应用定义模型



## 创建迁移表

在django里应用如果想要使用数据库的话，首先得定义模型。这个模型对应了数据库里表的结构设计。

model会有专门一章讲解。这里我们还是按照教程走，给polls应用新增两个model

```python
from django.db import models


class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')


class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)
```



把我们的应用去注册上，只要应用的`models.py`对类的属性有改动，都要运行`python manage.py makemigrations  <应用名>`，为模型的更改创建新的迁移表。

迁移表并没有直接生效，我们可以通过`python3 manage.py sqlmigrate <应用名> <生成的迁移表py文件名开头数字>`来检查创建表的sql语句。同样的也不会生效

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/sqlmigrate.png)



## 迁移表到数据库

创建迁移表后，将改动应用到数据库，数据库创建（或修改）相应的表。

`python3 manage.py migrate`

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/table%20name.png)



## ORM

blog应用的模型：

```python
from django.db import models

class Blog(models.Model):
    name = models.CharField(max_length=100)
    tagline = models.TextField()

    def __str__(self):
        return self.name

class Author(models.Model):
    name = models.CharField(max_length=200)
    email = models.EmailField()

    def __str__(self):
        return self.name

class Entry(models.Model):
    blog = models.ForeignKey(Blog, on_delete=models.CASCADE)
    headline = models.CharField(max_length=255)
    body_text = models.TextField()
    pub_date = models.DateField()
    mod_date = models.DateField()
    authors = models.ManyToManyField(Author)
    number_of_comments = models.IntegerField()
    number_of_pingbacks = models.IntegerField()
    rating = models.IntegerField()

    def __str__(self):
        return self.headline
```



新建迁移表，migrate生成表



### 增

建表通过定义model实现，所以关于增我们只需要关注如何新增一条记录。

```python
>>> from blog.models import Blog
>>> b = Blog(name='Beatles Blog', tagline='All the latest Beatles news.')
>>> b.save()
```



类名传参实例化一个对象相当于生成`INSERT INTO blog_blog(blog, tagline) VALUES('Beatles Blog','All the latest Beatles news.')`这样一条插入的sql语句



调用对象的save()方法相当于cursor.execute()执行插入语句，将对象保存为数据库中的一条纪录。





### 查









## sqlite3管理

先`apt-get install sqlite3`安装好sql shell工具

```
#打开sqlite数据库
 sqlite3 db.sqlite3
 
 # 显示所有数据库
 .databases
 
 # 使用某个数据库
 .open <数据库文件路径>
 
 # 显示数据库中所有数据表
 .tables
 
 # 查询数据表中的记录，查询语法和mysql大同小异
 select * from auth_permission；
 
 # 退出
 .exit
 
 # 查看帮助
 .help
```





