## service

service 微服务架构中的服务

每个Pod都会被分配一个单独的IP地址，可以通过endpoint(端点，IP地址+容器端口)以被客户端访问。但是多个Pod副本组成一个集群来提供服务时，就需要部署负载均衡器，为这组Pod开启一个对外的服务端口如8000端口，并且将这些Pod的Endpoint列表加入8000端口的转发列表，客户端就可以通过负载均衡的对外IP地址+服务端口来访问此服务。客户端的请求最后会被转发到哪个Pod，由负载均衡的算法所决定。

k8s中每个node上运行的kube-proxy进程就是用于实现负载均衡，而且k8s的另一个特点是：每个service会被分配一个全局唯一的虚拟的Cluster IP。每个服务就变成了具备唯一IP地址的通信节点，服务调用就变成了最基础的TCP网络通信问题。因此k8s集群内部的服务发现也变得非常简单，只要用Service的Name与Service的Cluster IP地址做一个DNS域名映射。



需要对外暴露的服务，配置NodePort，然后通过NodeIP:NodePort的方式访问



k8s中有三种IP：

1. Node IP：Node的IP地址

   Node IP是Kubernetes集群中每个节点的物理网卡的IP地址，是一个真实存在的物理网络，所有属于这个网络的服务器都能通过这个网络直接通信，不管其中是否有部分节点不属于这个Kubernetes集群。Kubernetes集群之外的节点访问Kubernetes集群之内的某个节点或者TCP/IP服务时，都必须通过NodeIP通信。

2. Pod IP：Pod的IP地址

   Pod IP是每个Pod的IP地址，它是Docker Engine根据docker0网桥的IP地址段进行分配的，通常是一个虚拟的二层网络，前面说过，Kubernetes要求位于不同Node上的Pod都能够彼此直接通信，所以Kubernetes里一个Pod里的容器访问另外一个Pod里的容器时，就是通过Pod IP所在的虚拟二层网络进行通信的，而真实的TCP/IP流量是通过Node IP所在的物理网卡流出的。

3. Cluster IP：Service的IP地址

   Cluster IP仅仅作用于Kubernetes Service这个对象，但并没有一个实体网络对象支持。所以只能k8s集群内部访问，无法与外部通信。



![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/describe%20service.png)



## ingress

Service的表现形式为IP:Port，即工作在TCP/IP层。而对于基于HTTP的服务来说，不同的URL地址经常对应到不同的后端服务器。这些应用层的转发机制仅通过Kubernetes的Service机制是无法实现的。

因此kubernetes新增Ingress资源对象，用于将不同URL的访问请求转发到后端不同的Service。

Kubernetes使用了一个Ingress策略定义和一个具体的Ingress Controller，两者结合并实现了一个完整的Ingress负载均衡器。使用Ingress进行负载分发时，Ingress Controller基于Ingress规则将客户端请求直接转发到Service对应的后端Endpoint（Pod）上，这样会跳过kube-proxy的转发功能，kube-proxy不再起作用。

![](https://cdn.jsdelivr.net/gh/cjyshow/docimg@main/http%E5%B1%82%E8%B7%AF%E7%94%B1.png)



看到这里，瞬间心想这不就是nginx的反向代理吗？区别只是k8s的ingress是将请求转发到k8s的service，而nginx则是将请求转发给服务器。

事实上，k8s中ingress的实现也是基于nginx的。









