# 使用 ELK 来分析你的支付宝账单

ELK 即 elasticsearch, logstash 以及 kibana。Elasticsearch 是一个基于 lucene 的分布式搜索引擎，logstash 是一种日志传输工具，也可以对日志数据进行过滤处理，kibana 则是基于 angular 开发的展示平台，可以进行数据的搜索以及可视化展示。目前 ELK 平台被广泛用于日志的分析处理。

## 支付宝账单
前几天看了一篇国外使用 ELK 分析账单的博客，突然冒出这个想法是不是可以使用 ELK 去分析支付宝账单。支付宝官网提供下载账单的地方，可以下载任意时间段的账单，可以下载 csv 以及 txt 格式的数据文件。登录支付宝官网首页产看点击查看所有交易记录就可以了。

[![9ePwm8.md.png](https://s1.ax1x.com/2018/02/03/9ePwm8.md.png)](https://imgchr.com/i/9ePwm8)

[![9einhj.md.png](https://s1.ax1x.com/2018/02/03/9einhj.md.png)](https://imgchr.com/i/9einhj)

可以切换到高级版查询数据，有更多的查询条件来查询数据，包括交易时间，交易状态，关键字等等，你可以下载任意时间段的数据。其实两种格式的数据都是 csv 格式的数据。
