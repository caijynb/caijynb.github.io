Kubectl是kubernetes的命令行工具，可以直接快速创建、更新Kubernetes对象。

kubectl的语法是：

```shell
kubectl [command] [TYPE] [NAME] [flags]
```

- `command`：指定要对一个或多个资源执行的操作，例如 `create`、`get`、`describe`、`delete`。

- `TYPE`：指定[资源类型](https://kubernetes.io/zh/docs/reference/kubectl/overview/#资源类型)。资源类型不区分大小写， 可以指定单数、复数或缩写形式。例如，以下命令输出相同的结果:

  ```shell
  kubectl get pod pod1
  kubectl get pods pod1
  kubectl get po pod1
  ```

- `NAME`：指定资源的名称。名称区分大小写。 如果省略名称，则显示所有资源的详细信息 `kubectl get pods`。

- `flags`: 指定可选的参数。例如，可以使用 `-s` 或 `-server` 参数指定 Kubernetes API 服务器的地址和端口。



我们可以从增删改查四个方面去学习kubectl的用法。

因为我是在公司的业务基础上学习的，所以我从kubectl的查询开始学起



## 查

### get

`get`命令用于基本输出

```
kubectl get namespace
kubectl get nodes
kubectl get pods
kubectl get service
```

搭配`-o wide`参数可以显示更详细信息

主要查询对象是`pods`和`service`，一般会跟`--namespace=<命名空间名>`来指定所在的namespace，当指定资源名称后，可以跟`-o yaml`获取pod和service配置的yaml文件。

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/kubectl%20get.png)

 ![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/kubectl%20get%20service.png)

### describe

`get`命令查询到的内容比较简单，一般都是用get查有哪些对象后用`describe`来查看具体的内容的

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/kubectl%20describe.png)

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/describe%20service.png)





## 改

```
kubectl edit service <servicename>
```

