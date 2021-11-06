# 概念术语

workflow(工作流程)：整个自动化操作流程



event(事件)：触发工作流程的特定活动，如有推送提交到仓库



jobs(作业)：作业是在同一运行服务器上执行的一组步骤。  默认情况下，包含多个作业的工作流程将同时运行这些作业。 您也可以配置工作流程按顺序运行作业。 



step(步骤)：单步操作



# yaml的编写

GitHub actions的配置文件叫做workflow文件，存放在代码仓库的.github/workflows 目录中。workflow 文件采用YAML格式，文件名可以任意取，后缀名统一为.yml。一个库可以有多个 workflow 文件，GitHub 只要发现.github/workflows 目录里面有.yml 文件，就会按照文件中所指定的触发条件在符合条件时自动运行该文件中的工作流程。

看一下官方给出的demo文件

```
name: GitHub Actions Demo
on: [push]
jobs:
  Explore-GitHub-Actions:
    runs-on: ubuntu-latest
    steps:
      - run: echo "🎉 The job was automatically triggered by a ${{ github.event_name }} event."
      - run: echo "🐧 This job is now running on a ${{ runner.os }} server hosted by GitHub!"
      - run: echo "🔎 The name of your branch is ${{ github.ref }} and your repository is ${{ github.repository }}."
      - name: Check out repository code
        uses: actions/checkout@v2
      - run: echo "💡 The ${{ github.repository }} repository has been cloned to the runner."
      - run: echo "🖥️ The workflow is now ready to test your code on the runner."
      - name: List files in the repository
        run: |
          ls ${{ github.workspace }}
      - run: echo "🍏 This job's status is ${{ job.status }}."
```



[具体的workflow语法文档](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions)在这里，我们简单总结一下下面这些关键的字段是怎么写的




## name:

工作流程的名称。

## on:

指定触发工作流程的事件
最常见的事件有
on: push  #仓库有新的推送


on:
  schedule:
    - cron:  '30 5,17 * * *'  #core语法实现定时推送，本例是在每天 5:30 和 17:30 UTC 触发工作流程

## jobs:

jobs作业，工作流程可以有一个或多个作业
我们直接在jobs字段下写一个或多个具体作业的名字，然后开始编写单个job的操作或者说job所具有的属性。
job主要是由runs-on和steps组成

### runs-on

runs-on: ubuntu-latest
配置作业在 Ubuntu Linux 运行器（当然是虚拟机）上运行

runs-on虚拟环境又称运行器，GitHub官方提供的[有哪些](https://docs.github.com/cn/actions/using-github-hosted-runners/about-github-hosted-runners)？

### stpes:

指定每个Job 的运行步骤

steps又有好多个step属性可用

- name: #说明现在步骤是什么，相当于打印注释
- run: #写shell命令 