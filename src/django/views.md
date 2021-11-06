每个视图函数，必须要做的就是返回一个被请求页面内容的 [`HttpResponse`](https://docs.djangoproject.com/zh-hans/3.2/ref/request-response/#django.http.HttpResponse) 对象或者或者抛出一个异常，比如 [`Http404`](https://docs.djangoproject.com/zh-hans/3.2/topics/http/views/#django.http.Http404)。

可以理解，web请求当然要有一个返回响应结果。





