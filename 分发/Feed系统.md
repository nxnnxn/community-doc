| 版本 | 时间      | 修改人 | 备注   |
| ---- | --------- | ------ | ------ |
| V1.0 | 2022.9.22 | 聂向南 | 初始化 |

> 目标:如何以最小的成本来完成业务的试错
>

## 1.需求背景

### 1.1.需求概述

> 相关PRD介绍,说明为什么要做这件事情(WHY)

### 1.2.需求干系人

> 单独拆分需求相关人员，用于冲突(WHO)

| 人员   | 项目角色 |
| ------ | -------- |
| 聂向南 | 研发     |

### 1.3.约束和限制

> 8C 指的是 8 个约束和限制,即 Constraints，包括性能 Performance、成本 Cost、时间 Time、可靠性 Reliability、安全性Security、合规性 Compliance、技术性 Technology、兼容性 Compatibility,前面定义目标的时候技术必须定义性能和可靠性因此在这里可以不定义<br>需求中涉及的成本,时间等仅仅是利益关联方提出的诉求，不一定准确；如果经过分析有的约束没有必要，或成本太高、难度太大，这些约束是可以调整的
>
> | 约束和限制 |                           条件                           |
> | :--------: | :------------------------------------------------------: |
> |    时间    |                   产运期望一个月内上线                   |
> |    成本    | 硬件成本:预算大概有年100W左右,人力成本:全力投入大概7个人 |
> |    安全    |                    需要注意防资产损失                    |
> |    合规    |              敏感数据和隐私数据如何保证合规              |
> |    技术    |     目前团队主要研发人员是 Java，最好用 Java 开发。      |
> |    兼容    |              业务上需要历史老接口,需要兼容               |

### 1.4.技术目标

> 任何架构总得有个技术目标,至少在稳定性和性能上要有最基本的,其他的指标项可以探索,也可以和业务目标绑定,一般不超过5个(WHAT)

| 场景               | 目标    | 备注 |
| ------------------ | ------- | ---- |
| Feed列表接口P99    | <=200ms |      |
| Feed列表接口可用性 | 5个9    |      |
|                    |         |      |

### 1.5.术语

> 领域模型

| 术语 | 定义 | 备注 |
|----|----|----|
|    |    |    |

## 2.需求分析

### 2.1.功能分析

#### 2.1.1.用例分析

> BDD模式,用于场景故事,核心是满足用户需求,用例分析需要include相关文档(HOW)



#### 2.1.2.领域模型分析

> 可参考[C4_Model](https://c4model.com/)  使用C4-plantuml绘画,领域模型是系统的上下文,有助于系统边界设计，一般情况领域模型不变的情况下属于L1



### 2.2.技术分析

> 非功能需求分析,核心是分析,通过业务给出的数据,来做预估和分析非功能需求复杂度,是提出问题的过程,而不是给出解决方案.

#### 2.2.1.可用性分析

> 可用性分析一般是复杂的,总体还是先谈指标,再谈设计,核心理念是失败的正常的,如何通过设计来保证高可用.
>
> | 可用性级别 | 系统可用性% | 宕机时间/年 | 宕机时间/月 | 宕机时间/周 | 宕机时间/天 |
> | :--------: | :---------: | :---------: | :---------: | :---------: | :---------: |
> |   不可用   |     90%     |   36.5 天   |   73 小时   |  16.8 小时  |  144 分钟   |
> |  基本可用  |     99%     |  87.6 小时  |  7.3 小时   |  1.68 小时  |  14.4 分钟  |
> |  较高可用  |    99.9%    |  8.76 小时  |  43.8 分钟  |  10.1 分钟  |  1.44 分钟  |
> |   高可用   |   99.99%    | 52.56 分钟  |  4.38 分钟  |   1.01 秒   |   8.64 秒   |
> |  极高可用  |   99.999%   |  5.26 分钟  |  26.28 秒   |   6.06 秒   |   0.86 秒   |
>
> 面向失败的架构设计原则:<br>容灾(主备切换,同城多活,异地多活)----系统统或项目的位置和部署环境。这包括了地理位置、硬件和软件组件的位置,以及数据的存储和处理地点(Where)<br>
> 容错(强弱依赖,降级熔断,资源隔离)----接口强弱依赖评估,外部接口降级熔断<br>
> 容量(稳态容量,尖刺容量,防护流控)----有多少用户？日活/月活有多少,容量需要预估多少
>
> 面向精细化运维管控原则:<br>可灰度(环境管理,版本控制,灰度策略)<br>
> 可观测(监控告警,日志事件,链路追踪)<br>
> 可回滚(配置开关,回滚策略,优雅上下线)
>
> 面向风险的应急快恢原则:<br>故障发现(统一告警,监控大屏,风险预测)<br>
> 故障响应(组织协调,告警关联分析,知识图谱)<br>
> 故障恢复(预案执行,故障自愈,故障复盘)<br>

#### 2.2.2.性能分析

> 性能分析首先我们要做的是通过业务数据来做性能预估<br>性能预估:主要根据场景分析QPS和TPS<br>

#### 2.2.3.扩展性分析

>可扩展性是指,系统为了应对将来需求变化而提供的一种扩展能力，当有新的需求出现时，系统不需要或者仅需要少量修改就可以支持，无须整个系统重构或者重建。由于软件系统固有的多变性，新的需求总会不断提出来，因此可扩展性显得尤其重要。在软件开发领域，面向对象思想的提出，就是为了解决可扩展性带来的问题；后来的设计模式，更是将可扩展性做到了极致。得益于设计模式的巨大影响力，几乎所有的技术人员对于可扩展性都特别重视。设计具备良好可扩展性的系统，有两个基本条件：正确预测变化,完美应对变化

#### 2.2.4.成本分析

>主要包含使用哪些云服务和相关运营的人力成本,通过业务数据预估使用量,从而获得相关费用.

#### 2.2.5.安全分析

>在架构安全上一般依靠运营商或者云服务商强大的带宽和流量清洗的能力,在功能安全XSS 攻击、CSRF 攻击、SQL 注入一般依赖安全团队提供的二放功能包，现阶段我们主要考虑业务架构上如恶意刷单,刷接口等,防止资产损失

#### 2.2.6.其他

>其他分析

## 3.技术选型

> 在这里我要给出解决方案,3-5个备选方案供大家参考,备选方案的差异要比较明显,但不能太细,备选方案的技术不要只局限于已经熟悉的技术,业务链路选型和功能需求有关，其他和非功能需求有关

### 3.1. 业务选型

 ### 3.1.1 关注流

> 相关文档简介
>
> https://help.aliyun.com/zh/tablestore/use-cases/design-a-feed-stream-system-that-supports-tens-of-millions-of-tps-and-qps

1. 拉模式&拉模式介绍

   

   

2. 推模式

   

### 3.1.2.推荐流







### 3.1.3.Feed聚合







1. 对于大V采用拉模式，读放大，生成feed列表。
2. 对于普通用户采用推模式，写放大，生成fed列表。
X 1. 发布itme时，如果是大V则仅写入到自身的发件箱中
2. 发布item时，如果是普通用户，则进行写放大的推模式
3. 读取Feed时，读取关注列表，从中识别出哪些是大V用户，并行的读取自身的收件箱，2 然后读取其他大V的收件箱，拿到i t e m i d l i s t 后进行合并，返回最新的f e e d 数据。
用户分级策略 对于大V用户
1. 通过粉丝数/离线通过舆情热度进行计算/ML模型打标等手段识别是否为大V，将大V作为一种用户 的标签属性进行存储。
2.通过Flink流式的计算，来识别是否为大V发文。
3. 大V仅能升级而不能降级， 一旦降级将需要回溯所有粉丝的收件箱
对于活跃用户
1. 基于月活/日活用户判断 一个用户是否为活跃用户甚至可以维护活跃级别
2. 一月内活跃为1级，收件箱保留长度100条，周活跃为2级，收件箱长度保留300条，前一天活跃为3 级，收件箱长度保留500条，用户平均一天刷N刷则为4级用户，保留1000条。
3. 大V用户也可以分级别，1000粉丝是1级，5000粉丝是2级，1000粉丝是3级等等，
X 1. 不同级别的大V可以push的粉丝比例也可以不同，优先将Feed推送给活跃用户，以保证 其用户体验。
2. 但这种方式就造成在读取的时候，为每个用户需要独立维护 一个关系状态，用来判断该 大V是否应该给此用户推送Feed，将会变得很复杂。
收益
实现上最为简单 1.读的延迟不如纯写放大，但也要快于完全的读放大。
2. 写的延迟不如玩去的读放大，但也解决了LadyGaga 问题
风险
产品功能受限
1. 大V用户如何识别才能避免边界问题造成的性能抖动?
2. 大V发布fe e d ，所有人去拉大V的最新fe e d ，如果大V的发件箱所 在服务器宕机，将导致大V发布的Feed丢失。
3. 如果用户关注的用户过多，收件箱列表过大，会造成大Key问 题，将如何解决?
4. app的注册用户很多，但是活跃用户较少，如果为每个用户都存 储收件箱是否会占用太多存储成本?
5. 对于写放大的推模式，如果一个feed被删除，那么删除状态应 如何快速更新?
6. 收件箱如果写入失败将如何处理?
7. 对于收件箱，redis内存的使用将随着用户的增多而增大，运维 与机器成本不可忽略。
给粉丝数加个上限
推拉结合
大v写放大不可行，可以降级为读放大模式。
1. 通过多种手段，可以避免大V的边界造成的性能抖动。
2. 通过细粒度的用户分级策略，可以在存储成本，读取延迟之 间作出较好的权衡。
3. 部分活跃用户的收件箱拥有大V的feed ，将减少对大V发件 箱的依赖，可靠性得到提升。
4. 仅对活跃用户进行推送，而不活跃用户将不会产生存储额外 的成本。
该



### 3.2.数据库选型



### 3.3.缓存选型



### 3.4.技术决策

> 列出我们需要关注的质量属性点，然后分别从这些质量属性的维度去评估每个方案，再综合挑选适合当时情况的最优方案。常见的方案质量属性点有：性能、可用性、硬件成本、项目投入、复杂度、安全性、可扩展性等。在评估这些质量属性时，需要遵循架构设计原则
> 1“合适原则”和原则 2“简单原则”，避免贪大求全，基本上某个质量属性能够满足一定时期内业务发展就可以了。

1. 212

## 4.详细设计

> 可参考[C4_Model](https://c4model.com/)  使用C4-plantuml绘画

### 4.1.应用架构

> 以实际创建的应用为主的架构,重点是可单独运行的进程主要展示哪些逻辑放在哪个应用里,包含了服务端应用,客户端应用,数据库,文件系统,各种中间件等,如果没有新建应用,一般不会做大的改动,属于L2

![Container diagram for Internet Banking System](https://www.plantuml.com/plantuml/png/fLN1RkCs4BtxAwRfeLv0Zb6WfvxMiOrkjdRYhfncUn96rDWcbY85ScIlKVJVErGKoN8MM1IzaKypRnxV3AdtWT5pNPhH3zegKnS41-Og_3gTUZpTxZKVwhmEv9MpJ9PlbIkdbK4RSoQ12wFpwVoNoIP2J-lLjCJ0v0NAvfA1sfA_hIB_Jr1RIIw51FX0i7F6k9EsUp0I16WB67pMFiZAWHG7unGQSnQEJkNR0l9rDVlhyMcRRHytsUBn-M7yhiTcQPR-ljpEFmZOGi_tsm_PQldRyc4Xu8Wr6uAE50gDUu-b2FLmRvcy9OOxj5-YvlGScChHQ4C-E3jMTM1NaazWtgrkPl0AWzirXyebEu6Jc0fLauYcmG2LShNbS2CwNgYpEm4AzEUn-bcuhWNSl8E_Hm3GwnsVAC-mgYJucNAOLPNH2baxUoFGHpnY0cdbe_Zrd_E8BSZeeyXef0MMM0LjcsCx6hYhcxyUV3CJaSFAeKAXI-MpeSa6znIhlrPDbTSL9p2p-zgWZ_36kwCkA00Qy-qgEvcLA1sDvZEmwvmCSDGOSxG7EJ3atfq2-JUIIfThGwqVwxZfHCr_JE0pbYXM3CM0qQLcAY3KUI2MflqFSIy2eA2ZLdGjRv6F2sJCCL3iGxkCQj8_LZ3Oi_EYBTv0yBJNWNtJKz1Mvh9irWaSC1n4DzPy0EMf8CiQJKZYN548ODnUDiJgzerHEQelP0jnIiUHtTn_Ut8MJi9ydpTmxZiEHLE4M4h_qqttyYkFgKHjij00GhUSh6NVtgp8lnNpTKED1jPQUHVSZc7vLHtGxWbUCeNsWhDLqBCAfzrvBEdgwlRcDbFOzbe9q9tYmcB0tDNSDphfRcm2xD46RCxRcppwHERYLUZlvbEW46j_s6utgGGEuqA5turfHxkdQyjb3wJtXzprBq53rz_pbga11stl2c8uMvN0n_JnONfPl2_v7pEpEudkXVL3FsJvH5W4s7bNDW_FoMkc0EmYSqkyk9iBPSTvuSVL6AL26u0c4MquUY5N4pVKCCohWqn0NpvTRpT2D71va3wSkzwO9d_QklDvlUhCUI-fyQ_rBm00)

1. 描述各个核心领域应用，以及应用如何协作

### 4.2.核心流程

> 以组件为依托,通过组件图和组件时序图来描述核心流程,其中组件为和外部系统做核心交互的业务功能,时序描述这些组件在不同的用户流程下如何运
>
> 组件图属于L3级别

#### 4.2.1.A流程

> 通过组件图描述基本流程之后,重点要通过文字说明哪些非功能需求在是如何解决的

![Component diagram for Internet Banking System - API Application](https://www.plantuml.com/plantuml/png/fPHDR-Cs48Rl-XNJ75e7IE9BJpsjuwJTB9AD4JlzE1aZSYonvOT0KdQDel-zGyesRISe0kn953cSUUQTL_eK8lhO6rrzfwpGlIHeO-p2J-EnnyrDesBRrtqWBvoDPEEDS6RSQRJfpdM8KgjwFFtnUfQsNfyUnmP39CzRowapdRFfJfVo_m2zvSk6Do2s12kdjTiesu1MbW2jX9DZvGEl771nq4wWrblESQ1yMw1wdFpn_BfO_lQm-BnylF_b_klTwBAgeegQu10BKc7ZqN1z3m-MMIr5k4NxLqAPRvdUm3LCPWymwJgj14RbR5LDkNzaK3yA7Lx1nPp3EUyC6peElE2ZFt6DGNZLnTmLsgRNwDF9pBkraXG0jSvTgZr0lGDOiKWf3seLjwbzqOVe3Fa0QuNfZlAmeHfgxpQ1_Ct5vH6QIMHFhbOwGwMIlwD1h-nfTT3Ag4WIGby7hkxYDz2ON6__aBHMWawmxkgHhBd-7KQiCL1YUI6DGsRORyDSj6GmdSwZyyoPV0UU6XMYpz5Co6CpUNq5BOQM963F73Rk1W32aqolgCCLe10K0cZNy0j5aRY66I_l_uuZKuSa679QZuRER518yhpSAeiaUECWq14FOEtwM1JAnLrl8wyOtmRCKXQE8j3obkCa-kq8EyL5pyntSGd_L01GJ3mAgh69ZXziOaYPlDEQiikUVft22uLujZr9tziWQaYpJ3b0MLw-F_mmY71vLlhG5MVSBM7U6yFu7-8eDYncsgZO0aBOfHcKLZwZ76HyGn98z9wDcOJOBSjf7bxdKoEtX2V-FxErJrOacINXy66iLo1Q75uw367Zl2oJEyLW4wrGeAJ_iHByd2FUWPh0S1cStGt2x7ESJI9LpgLVIEyCSAJ0Qo1Mw71UfbJmtWILwxBEtoHA-1usl4KGNQBxSdSxBHUEM-NbFc7wo_2V__DYCPjpyBzLbMBpRp9Zbh0ly-Ul-xWIL5ZV3yoHvWFPp0UIVI8hUwF_0m00 "Component diagram for Internet Banking System - API Application")

1. 高可用/高性能/可扩展/安全



##### 4.2.1.1 A时序

> 组件下的主要时序图,有可能不只一个,细节描述组件是如何运作的

![C4_Sequence Diagram Sample - bigbankplc](https://www.plantuml.com/plantuml/png/NL9BRnCn4BxdLmmv1PGc0df2GZIFYXRr4NKB7ADPxsJNmXulzhXH_psURQE6tEnvV8_FlaY2KR9tetUMZSiDGIVIfo_pUSJzhBNIvJedYYQm4ClC13_l7RBkd2LfdAtdg_EpZPP-tjxCFIQXM4hRYlvcOaEpNk57gmA0bYbEpCSfZ2lBhQEp3RO4Yxvtrg3OmEFI-e5FM9beUm7a1XRSPeTHEviOdcn32T0v23kGZk2Q2n-JG8tyfu32BhDHA7HMda42c9maU8e9dYpgZesmfnhg6FR5sMpy_aZTTXaoDnYV9tKXN6okZzMLIO1Ly7rWOfcOJuEHbk6QGH5YS8xYMAjzL2stlrRmG4bEkWld2ZLehaaL9iMmN8x_Mrg-MggUIwX-Tah_MOd8v5YCljMFw9U4V9pRIJOFv52eEIZG3SjJC1rogvSUKzg7sAGfa1YbFuIplUHcSXpRkfwOyyAqHi4Q4ochmh-GmQ4CbUd8etOh2P5UCe18hKqITLfps8NeX_CKEamTDO1PEc9vVGOmaHgzeYlIq1XA2LnettIE2lVmprwUADVUIZfU0md3Lwlkx-PNZu-RgYpfZiuFkQxGbIcR5c_CL2n3uCDacHei9t9a13x0BWR_-gRxZY8DPqPFy1M-3MphvQfiZwgh-z_RcyllbtVh4k85SPEz-mS0 "C4_Sequence Diagram Sample - bigbankplc")

### 4.3.存储设计

> 系统中数据库表如何设计,缓存如何设计,有哪些消息结构

#### 4.3.1.数据库设计

> ER图,状态机跃迁图等

#### 4.3.2.缓存设计

> 缓存使用的数据结构和本身

### 4.4.部署架构

> 以应用视角为主线,主要描述多地部署时,应用如何运行

![Deployment Diagram for Internet Banking System - Live](https://www.plantuml.com/plantuml/png/pLP_J-D64Fq_dsAQLkA7W41AArJff0i9FK24H3YKLgg4nhiJPylQQ-sk0sbrtxqpSgW9ILle_LCZHTxnl9atRsTs-HWY-bZbjWNmbIcKhJJ1BCOo_D3fU7myo4oSLMaLo2jNH2hYWN9vfxHO26e_H6rDskaVxu_5T3kywkGO8dastG-ej6wH2wYK55jG5OmM0yGPmTHPwnvDaO4r1G4M6bO-6n_upG5d1-iKMhjeRJKqDsHezRG-ioI62MRRxIbZKbGFxJtu9itwpZh_eVsrEfI_zevutv1Tyupq55TznIeSdwt7tvuC1jzn1ER3l5HbCP86Inbn4IO8PGtRgAAPonSm1LZM1IJ83eEkUh-CRYVtTnUJy_khiqzdruDj3XPDj0HDKJ0mc7dCMIaF5oo_BoZ2AHOF8bgoOA5ps8ShCwTMgu7TNpjDswLLUz0-DHa807ZPVhK6ZH51aGHkx_pH0dvUHz45WrAJfOpPnzBixkx-6fzE9DHjMd4JmD7t1uV7S3L9daDi2eCbgXang2Sl11ENAupjrmOuENXgmjHFtnKHMJRFGOm0nXVGAqjhsD-uGc9SuXn1sYSflIWp_Aalvh5tSwCfh4itvKOKC5eJ5p0tZ8RBP7JTEPzCnWbmYWFUN5W-drlrxwR2bjBezF3eXL2oVAz4pgEo8j58NWZsOUnDZdxHRcn7NVMtyWpIRPsowm0ZfXX8ODpTMDS9psP8MEuSvMiIdIVfLVBWAJCXUXHlC0KtN8xolWSp33FIW5MSCTUbwg0yQLcY3Nk0Ib48O5t62uhg_U9rLyNhRXHFHXEpyA4PrXtuDpsxBmLDIBb2hqlwpu7NLUx-NsHU8_vMuTENWZzIMe_ryNyRw-uNpZNdPy0TfM-Swm5PCoSVWAM24DbTmV9s4cynhuzyu1zBK696W4sQJQtwUVqmpPrGx5SXkfpyLW0s60wdQMuKrVMMbjEE4d0UUeNspcWfURNK6iRkmnhFA07_Z3boXIk75e8rkP7B8rHfe0XkkbxP-c4M7QWbpI0dcs2CN-NBHMygKhcyNArIB9NS3iBOUEM2cqQuCuLsZq48rLNdg4RI9vjxpRCl-UKEdzOh2VZ9ETcH_ioxd2KPkj-DjGW_6azJzxItZ9tWbAKHKOT6-Ph0cSv8qgstKYXH9gxUwp5cjAcb4kLDMRTAhyWgYtvLU6k_J6lkPrXMpKetJNL3zgy6gE-o8JvmGhdH56SD752O_1PSKTz4Z1OGL_K-nFrjFLGCN9aN9mn1DHlyWcgDh2zPBTr-GwW3JBtBHIfuz2RISyBBmMb_5T1z0sBZUILqR_XGROBK6yP8ZH4Ppawjv7nqr_odz94ANUNsJm00 " Deployment Diagram for Internet Banking System - Live")

## 5.横向概念

### 5.1.接口定义

> 需要引入其他文档,直接使用.proto文件,通过proto文件可快速生成对接文档

### 5.2.消息定义

> 该系统的相关消息定义

### 5.3.可运维定义

#### 5.3.1.动态配置

> MSE相关应用配置链接

#### 5.3.2.降级配置

> 降级系统配置链接

#### 5.3.3.预案配置

>预案配置链接

#### 5.3.4.机器人播报配置

> 机器人配置链接

### 5.4.数据及埋点

#### 5.4.1.技术埋点

> 缓存命中率埋点

#### 5.4.2.业务埋点

> 业务提出需求的埋点

## 6.排期规划

``` mermaid
gantt
    dateFormat  YYYY-MM-DD
    title       Adding GANTT diagram functionality to mermaid
    excludes    weekends
    %% (`excludes` accepts specific dates in YYYY-MM-DD format, days of the week ("sunday") or "weekends", but not the word "weekdays".)

    section A section
    Completed task            :done,    des1, 2014-01-06,2014-01-08
    Active task               :active,  des2, 2014-01-09, 3d
    Future task               :         des3, after des2, 5d
    Future task2              :         des4, after des3, 5d

    section Critical tasks
    Completed task in the critical line :crit, done, 2014-01-06,24h
    Implement parser and jison          :crit, done, after des1, 2d
    Create tests for parser             :crit, active, 3d
    Future task in critical line        :crit, 5d
    Create tests for renderer           :2d
    Add to mermaid                      :1d
    Functionality added                 :milestone, 2014-01-25, 0d

    section Documentation
    Describe gantt syntax               :active, a1, after des1, 3d
    Add gantt diagram to demo page      :after a1  , 20h
    Add another diagram to demo page    :doc1, after a1  , 48h

    section Last section
    Describe gantt syntax               :after doc1, 3d
    Add gantt diagram to demo page      :20h
    Add another diagram to demo page    :48h
```



