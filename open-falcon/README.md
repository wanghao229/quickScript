
### 介绍
* https://toutiao.io/posts/lha0c8/preview


### RDDTool
* https://www.jianshu.com/p/b925b1584ab2



#### 比较详细

* https://blog.csdn.net/Danielsm/article/details/123531933

```
{
    metric: load.1min,                        // 监控项名称
    endpoint: open-falcon-host,               // 目标服务器的主机名
    tags: srv=falcon,idc=aws-sgp,group=az1,   // tag标签，作用是聚合和归类，在配报警策略时会比较方便。
    value: 1.5,                               // 监控项数值
    timestamp: `date +%s`,                    // 采集时间
    counterType: GAUGE,                       // 监控项类型。 
    step: 60                                  // 采集间隔 秒。
}
```



#### 报警函数说明

```
all(#3): 最新的3个点都满足阈值条件则报警
max(#3): 对于最新的3个点，其最大值满足阈值条件则报警
min(#3): 对于最新的3个点，其最小值满足阈值条件则报警
sum(#3): 对于最新的3个点，其和满足阈值条件则报警
avg(#3): 对于最新的3个点，其平均值满足阈值条件则报警
diff(#3): 拿最新push上来的点（被减数），与历史最新的3个点（3个减数）相减，得到3个差，只要有一个差满足阈值条件则报警
pdiff(#3): 拿最新push上来的点，与历史最新的3个点相减，得到3个差，再将3个差值分别除以减数，得到3个商值，只要有一个商值满足阈值则报警
lookup(#2,3): 最新的3个点中有2个满足条件则报警；
stddev(#7) = 3：离群点检测函数，取最新 **7** 个点的数据分别计算得到他们的标准差和均值，分别计为 σ 和 μ，其中当前值计为 X，那么当 X 落在区间 [μ-3σ, μ+3σ] 之外时，则认为当前值波动过大，触发报警；更多请参考3-sigma算法：https://en.wikipedia.org/wiki/68%E2%80%9395%E2%80%9399.7_rule。
```



#### 疑问

* heartbeat(hbs) 和 endpont 是怎么关联起来的。不管了。
  * py 只是被执行，agent 才是调用者，封装给server 的不止这些数据。
