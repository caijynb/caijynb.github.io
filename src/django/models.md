## 快速入手

```python
from django.db import models

class Person(models.Model):
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
```

first_name和last_name都是模型的一个字段。这个模型对应一张数据表，它的这些字段对应了表的字段。



`python manage.py makemigrations`创建迁移表

`python manage.py migrate`将迁移表应用到实际的数据库里：

```
CREATE TABLE <应用名>_person (
    "id" serial NOT NULL PRIMARY KEY,
    "first_name" varchar(30) NOT NULL,
    "last_name" varchar(30) NOT NULL
);
```



发现这里建表的时候多了一个`id`字段，还被自动设成了主键。这是Django的默认设置，因为Django需要每个模型都有一个主键，当我们显式的设置模型中某个字段` primary_key=True`，就不会自动增加`id`字段了





## 常用的字段类型



#### AutoField  

 特殊的`IntegerField`，根据可用的 ID 自动递增。一般不需要指定，如果我们的模型类没有设置为主键的字段，Django在建表的时候会自动增加一个名为`id`的自增主键字段。



#### BigAutoField

特殊的`BigIntegerField`，和`AutoField`类似





#### IntegerField

整数类型字段，从 `-2147483648` 到 `2147483647` 

对应数据库里的INT/integer类型





#### BigIntegerField

64位整数类型字段，从 `-9223372036854775808` 到 `9223372036854775807` 



#### DecimalField

固定精度的十进制数，在 Python 中用一个`Decimal` 实例来表示，对应数据库中的decimal类型。Decimal类型的数据并不是浮点数，没有精度的损失！

两个必须的参数：

1. **max_digits**：数字允许的最大位数（整数位数+小数位数）
2. **decimal_places**：小数位数

显然max_digits必须要大于等于decimal_places



#### FloatField

单精度浮点数，在 Python 中用一个 `float` 实例表示的浮点数。对应数据库中的real类型（4字节，大约九个有效数字的单精度浮点数）



####  BooleanField

一个 true／false 字段。



#### CharField

字符串类型字段，对应数据库的字段类型是varchar，因此使用CharField这个字段必须带上`max_length`这个参数





对于大量的文本，使用 `TextField`



#### TextField

用于保存大量文本的字段类型，对应数据库的字段类型是text



PS: Oracle不支持 TextField 的字符序。





#### DateField

日期类型字段，在 Python 中用 `datetime.date` 实例表示



#### DateTimeField

一个日期和时间，在 Python 中用 `datetime.datetime` 实例表示。



#### TimeField

时间，在 Python 中用 `datetime.time` 实例表示。



PS:`DateField`、`DateTimeField`和`TimeField`都有相同的两个可选参数：1.**auto_now**，设置为True后，调用 [`Model.save()`](https://docs.djangoproject.com/zh-hans/3.2/ref/models/instances/#django.db.models.Model.save) 时，该字段会自动更新 2.**auto_now_add**，设置为True后，第一次创建对象时，自动将该条记录的这个字段初始化为（创建时的）当前时间。

这两个参数是互斥的，只能有一个被设置为True



#### EmailField

一个`CharField`，使用 [`EmailValidator`](https://docs.djangoproject.com/zh-hans/3.2/ref/validators/#django.core.validators.EmailValidator) 来检查该值是否为有效的电子邮件地址。



#### UUIDField

一个用于存储通用唯一标识符的字段。使用 Python 的 `UUID` 类。当在 PostgreSQL 上使用时，它存储在一个 `uuid` 的数据类型中，否则存储在一个 `char(32)` 中。

