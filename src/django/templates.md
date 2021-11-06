templates是表现层，负责页面的显示。一般都是特殊语法的html文件，然后由视图函数去渲染。



**django的templates，最标准的写法是在应用目录下新建一个templates目录，再在templates目录下新建一个应用同名目录。在这个目录下面写模板html文件**



index.html

```html
{% if latest_question_list %}
    <ul>
    {% for question in latest_question_list %}
        <li><a href="/polls/{{ question.id }}/">{{ question.question_text }}</a></li>
    {% endfor %}
    </ul>
{% else %}
    <p>No polls are available.</p>
{% endif %}
```





views.py

```python
from django.shortcuts import render

from .models import Question


def index(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:5]
    context = {'latest_question_list': latest_question_list}
    return render(request, 'polls/index.html', context)
```



![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/render.png)



## render函数

render，绘制渲染函数。顾名思义，render函数是将我们选择的模板文件给渲染了。载入模板，填充上下文，再返回由它生成的 HttpResponse对象



render的三个参数，第一个参数，request请求；第二个参数模板文件，默认的路径是应用的templates目录下，第三个参数是传给模板的内容，一些变量的值





## 模板语法

### {{ }} 包裹变量

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/hellocaijiayu.png)



**字典的键**、**列表的元素**、对象的属性值都是用`.`选的

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/templates point.png)





### {% %}包裹标签

标签的用处比较多，有的在输出中创建文本，有的通过执行循环或逻辑来控制流程，有的将外部信息加载到模板中，供以后的变量使用。

#### if 标签

if、elif、else

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/if tag.png)

1：if标签必须要对应一个endif标签

2：变量写在{% %}标签里，不需要包裹{{ }}。写了反而会报错

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/parse remainder error.png)



#### for标签

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/for tag.png)

标签一般用于遍历列表，每个for标签都必须对应一个endfor标签



#### block标签

block标签非常强大，它让我们实现写一个父模板，别的模板直接继承这个父模版修改block。

我们放模板继承里重点来讲block标签的用法。

每个{% block <块标签名> %}都有对应的{% endblock %}





## 模板继承

**用于被继承的父模板写在应用的templates下，而不是写到templates/<应用名> 下**。

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/block tag.png)



继承的模板第一行必须写{% extends  %}



父版块标签可以写默认值，如果子标签不设置块标签的话，会默认使用父标签的值。



模板的块标签名不能重名



继承的模板不在块标签里写html语言是不会生效的

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/html not work.png)

