# 使用 ELK 来分析你的支付宝账单

ELK 即 elasticsearch, logstash 以及 kibana。Elasticsearch 是一个基于 lucene 的分布式搜索引擎，logstash 是一种日志传输工具，也可以对日志数据进行过滤处理，kibana 则是基于 angular 开发的展示平台，可以进行数据的搜索以及可视化展示。目前 ELK 平台被广泛用于日志的分析处理。

## 支付宝账单

前几天看了一篇国外使用 ELK 分析账单的博客，突然冒出这个想法是不是可以使用 ELK 去分析支付宝账单。支付宝官网提供下载账单的地方，可以下载任意时间段的账单，可以下载 csv 以及 txt 格式的数据文件。登录支付宝官网首页产看点击查看所有交易记录就可以了。

[![9ePwm8.md.png](https://s1.ax1x.com/2018/02/03/9ePwm8.md.png)](https://imgchr.com/i/9ePwm8)

[![9einhj.md.png](https://s1.ax1x.com/2018/02/03/9einhj.md.png)](https://imgchr.com/i/9einhj)

可以切换到高级版查询数据，有更多的查询条件来查询数据，包括交易时间，交易状态，关键字等等，你可以下载任意时间段的数据。其实两种格式的数据都是 csv 格式的数据。表格数据主要包含以下信息：

交易号 商户订单号 交易创建时间  付款时间 最近修改时间 交易来源地 类型 交易对方 商品名称 金额（元）收/支 交易状态 服务费（元）成功退款（元）备注 资金状态   


## 安装

ELK 三个软件的安装都十分简单，下载就可以使用，无需安装。可以去 https://www.elastic.co/cn/downloads 下载页面选择合适的工具进行下载。三个工具的使用都十分简单，一般只需要运行 `bin` 文件下的 bat 文件就可以了。我下载的都是最新版本的，即 6.1.2 版本。

### elasticsearch
 
 运行命令：`elasticsearch.bat`
 
验证 ES 运行成功，可以使用 `curl` 命令，`curl http://loclahost:9200` 或者直接使用浏览器访问 `localhost:9200`

```
{
  "name" : "ZWtApuh",
  "cluster_name" : "elasticsearch",
  "cluster_uuid" : "DyfiD0NlSkuDdE5m-NBRAg",
  "version" : {
    "number" : "6.1.2",
    "build_hash" : "5b1fea5",
    "build_date" : "2018-01-10T02:35:59.208Z",
    "build_snapshot" : false,
    "lucene_version" : "7.1.0",
    "minimum_wire_compatibility_version" : "5.6.0",
    "minimum_index_compatibility_version" : "5.0.0"
  },
  "tagline" : "You Know, for Search"
}
```

### 运行

整个框架数据流转的过程大致是这个样子的：

[![9nqI8f.md.gif](https://s1.ax1x.com/2018/02/04/9nqI8f.md.gif)](https://imgchr.com/i/9nqI8f)

