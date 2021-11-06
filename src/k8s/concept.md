## namespace

命名空间（namespace），用于在多个用户之间划分集群资源。形成逻辑上分组的不同项目、用户组。



## node

node、节点，即独立的一台服务器，每个节点会被master分配一些工作负载，当节点宕机时，它的工作负载会被master自动转移到其他节点上。



## master

master是集群控制管理的节点，k8s集群都必须有一个mastrt来负责整个集群的管理和控制，所有的kubernetes控制命令都是发给master，由它来负责具体的执行



## pod

pod是运行在节点上的一组（一个或多个）容器。这些容器共享存储、网络、以及怎样运行这些容器的声明。



## deployment

怎样运行这些容器的声明，就是deployment了。deployment用于在节点上编排pod，通过创建deployment来完成对pod的创建。



## statefulset

statefulset同deployment 一样，是pod的管理对象。区别在于deployment管理的pod，一般都是无状态的服务。但是一些服务是有状态的，特别是一些复杂的中间件，比如mysql、MongoDB、zookeeper、reddis。

有状态的服务集群要求部署的节点有固定的身份id，这样便于集群成员去发现这个服务。此外需要对数据做持久化存储

通过deployment控制pod副本，pod的名称是随机的、ip地址也是运行期才分配的。

因此引入了statefulset这个资源对象。statefulset里的pod都有固定、唯一的网络标示，可以用来发现集群内的其他成员。statefulset里的pod采用稳定的持久化存储卷，通过PV或PVC来实现，删除POD时默认不会删除与stateful相关的存储卷

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/deployment%E5%92%8Cstatefulset.png)





## Volume

存储卷，是Pod中能够被多个容器访问的共享目录。Kubernetes的Volume概念、用途和目的与Docker的Volume比较类似，但两者不能等价。

首先，Kubernetes中的Volume被定义在Pod上，然后被一个Pod里的多个容器挂载到具体的文件目录下；其次，Kubernetes中的Volume与Pod的生命周期相同，但与容器的生命周期不相关，容器终止或者重启时，Volume中的数据也不会丢失。



## Persistent Volume

Volume是被定义在Pod上的，属于计算资源的一部分。

Persistent Volume是网络存储，是相对独立于计算资源而存在的一种实体资源。

PV可以被理解成Kubernetes集群中的某个网络存储对应的一块存储。不属于任何的Node，不被Pod定义，但每个Node和Pod都可以访问。



## ConfigMap

ConifgMap这个概念需要从docker说起

Docker通过将程序、依赖库、数据及配置文件“打包固化”到一个不变的镜像文件中的做法，解决了应用的部署的难题，但这同样带来了问题：即配置文件中的参数在运行期如何修改的问题。docker提供了两种常见的解决方案：

* 在运行时通过容器的环境变量来传递参数

* 通过Docker Volume将容器外的配置文件映射到容器内

在分布式系统运行的情况下，这两种方式都不合适。因为在多台服务器上修改其上运行的多个服务的配置文件实在是太麻烦了...

ConfigMap提供了集中管理系统的配置参数的作用，所有的配置项都是键值对字符串。这些配置项可以作为Map表中的一个项，整个Map的数据可以被持久化存储在k8s的Etcd数据库中，然后提供API以方便k8s相关组件或客户应用CRUD操作这些数据。k8s还提供了一种内建机制，将存储在etcd中的ConfigMap通过Volume映射的方式变成目标Pod内的配置文件。如果ConfigMap中的key-value数据被修改，则映射到Pod中的“配置文件”也会随之自动更新。

