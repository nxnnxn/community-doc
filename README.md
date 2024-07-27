| 版本 | 时间      | 修改人 | 备注   |
| ---- | --------- | ------ | ------ |
| V1.0 | 2022.9.22 | 聂向南 | 初始化 |

> 该文档的目标是总结和梳理技术的架构的全流程模版,相关实践从 [社区.md](社区.md) 开始看
>
> 1. 需求背景:主要需求概述,目标,人员&术语.面向对象是全体人员,目的是初略的介绍这个需求.
> 2. 需求分析:主要是业务功能拆解和技术需求拆解,面向对象是全体人员,目的是分析需求
> 3. 概要设计:主要是领域模型分析，备用方案和选型决策,落地执行,面向对象是研发/测试人员,目的是通过多种技术手段来将问题域拆解到执行域,使得需求可以得到执行.
> 4. 详细设计:主要是本领域内的详细设计和其它领域的通信定义，面向对象是研发/测试人员，目的是通过细节设计完成业务目标和技术目标.
> 5. 排期规划:主要是工时和排期规划,面向研发/测试人员，目的是为了确定工作量和相关业务里程碑
> 6. 项目实施:主要是过程中的机制和讨论文档，面向对象是研发/测试人员/PMO，目的是过程中的风险进行相关检测,讨论和解决.
> 7. 业务复盘;主要是复盘文档，面向对象所有人，目的是总结和梳理过程中的好与坏，尤其是决策，同时判断业务和动作是否正相关，为下一次需求迭代有一定的数据基础。



## 1.需求背景

### 1.1.概述

> 这里是一组需求的基本描述,表明了该目标下衍生出来的各种需求
>

| 需求分类 | 需求描述 | PD   | 优先级 | 期望排期 | 备注 |
| -------- | -------- | ---- | ------ | -------- | ---- |
|          |          |      |        |          |      |
|          |          |      |        |          |      |
|          |          |      |        |          |      |

### 1.2.目标

> 1. 设定目标
>    1. 目标要满足SMART原则:具体（Specific）、可度量（Measurable）、可达（Achievable）、相关（Relevant）、有时效的（Time-bound）
>    2. 正确的目标,是靠多个职能之间反复讨论和反复演算得到的.是通过严密的逻辑和数学论证出来的,核心是科学决策
>    3. 合理的目标:需要一个带来有挑战和成就感的目标,但不合理,需要向上反馈，把目标调整到一个合理范围内
>    4. 可达的目标:目标如果重大风险需要有足够的预案,也就是planB
>    5. 需要有一定的技术目标,技术上有哪些先进性,提效研发效率还是稳定性等。
> 2. 确认目标
>    1. 需要向上聚焦 , 思考目标是否和当前企业的长期价值相匹配,如果不匹配,尝试沟通来改变,反之思考有没有更加合理的目标,在整个过程中,需要正确的取舍(向上沟通),除了思考方案以外，还要思考
>       1. 技术驱动目标:新方案的实现成本有多少？上线后带来的短期价值有多大？是否可以全面替代现有方案?全面替代的实施成本有多少？全面替代之后，这个新方案带来的长期价值是什么？如果不能全面替代，而是两套方案并存，那么增量的维护成本有多大？
>       2. 业务驱动目标:如果需求不能全部满足, 需要取舍的话,自己做个取舍优先级，然后耐心解释给决策者，请他来做取舍,实在不行，用技术手段来做延迟或者隔离决策
>    2. 需要和业务方(可以拉资源的团队)确认目标,看目标以当前的资源投入和现有风险下,是否可达(业务沟通)
>    3. 需要和联动方审视目标,了解当前所面临的挑战是什么,投入的真实带宽有多少,能否有长期价值，从而判断目标是否合理(左右沟通)

| 场景 | 目标 | 备注 |
| ---- | ---- | ---- |
| 业务 |      |      |
|      |      |      |
| 技术 |      |      |
|      |      |      |

### 1.3.约束

> 8C 指的是 8 个约束和限制,即 Constraints，包括性能 Performance、成本 Cost、时间 Time、可靠性 Reliability、安全性Security、合规性 Compliance、技术性 Technology、兼容性 Compatibility,前面定义目标的时候技术必须定义性能和可靠性因此在这里可以不定义,需求中涉及的成本,时间等仅仅是利益关联方提出的诉求，不一定准确；如果经过分析有的约束没有必要，或成本太高、难度太大，

| 约束和限制 |                           条件                           |
| :--------: | :------------------------------------------------------: |
|    时间    |                   产运期望一个月内上线                   |
|    成本    | 硬件成本:预算大概有年100W左右,人力成本:全力投入大概7个人 |
|    安全    |                    需要注意防资产损失                    |
|    合规    |              敏感数据和隐私数据如何保证合规              |
|    技术    |     目前团队主要研发人员是 Java，最好用 Java 开发。      |
|    兼容    |              业务上需要历史老接口,需要兼容               |

### 1.4.干系人

> 1. 梳理各个角色
>    1. 真实需求的产生者,也就是真实需求在架构活动中到底是谁,是用户通过产品之手出来的，还是供应商通过运营之手说出来了，还是平台自身需求。
>    2. 资源赞助者，通常是你老板，他可以在资源上帮你协调
>    3. 需求上下游产业链所关注的人，如研发OWNER,测试OWNER，运营OWNER等
> 2. 确定各个角色心理预期和业务优先级
>    1. 确认从上到下的对需求的ROI的认识，重点看对此需求有强依赖的业务的认识和最难搞定的依赖方的认识
>    2. 确认投入人力大小，以及各个依赖方现有优先级问题，强依赖难搞定需要求同存异.
>    3. 在充分理解人性的基础上，给到大家合理的解决方案
> 3. 确定同步机制
>    1. 内部讨论群:XXX研发群(管理员),相关二维码
>    2. 周会/双周会,周会邮件会向研发群相关发出
> 4. 商讨冲突解决机制
>    1. 首先看价值:我们的用户是谁?我们的客户是谁?我们长期价值是什么?我们短期价值是什么?如何平衡?
>    2. 其次看目标上是否合理和合适，以及投入和判断
>    3. 最后冲突上升解决

| 人员   | 项目角色 | 架构是否确认 |
| ------ | -------- | ------------ |
| 聂向南 | 研发     |              |

### 1.5.术语

> 在业务领域建模的时候需要通过统一的语义来完成对业务的抽象.
>

| 术语 | 定义 | 备注 |
| ---- | ---- | ---- |
|      |      |      |



## 2.需求分析

> 这是个问题域拓展的过程,针对需求做深度挖掘和目标的二次探索
>
> 1. 首先进行功能分析,通过需求和业务目标的关联度分析和业务分析,看需求本身可否被推导和证明?是否有更合理的业务目标可以被提出?最后判断需求是不合理需求,脑洞业务尝试,数据证明的业务尝试,公司重大战略(战略一般有数据).从而判断优先级.
> 2. 其次进行非功能分析,通过技术,成本,时间约束等,来给功能提出相关约束,在以终为始目标的基础上,提出相关的技术目标.
> 3. 最后通过SMART原则设定相关目标,做相关确认

### 2.1.功能分析

> 功能主要是对现有业务方案

#### 2.1.1.用例分析

> 技术驱动的需求需要思考全流程，业务承接的需求需要思考4,5
>
> 1. 分析自身所处环境
>    1. 通过竞品分析,业界报告,个人实践总结,第一性原理来完成自身对这个事情的认知.
>    2. 通过数学公式办确定团队的商业模式.确定所做的事情和公司的商业有关联。
>    3. 确定当前团队所处的环境状况，是客户第一还是老板第一.现在团队花的钱是我从客户那里赚的还是我从老板那里要的
> 2. 分析组织大目标进行相关拆解:
>    1. 过程中思考技术的作用,可以为公司或者团队带来什么正相关向。
>    2. 实现一个新的商业模式，考验时间成本、机会成本，包括技术的迁移成本和效率之间的判断
>    3. 提升一个商业模式的效率，寻找扩大收入的机会，
>    4. 加速一个商业模式的收敛速度，做相关效率工具，提升前两者的效率，做到收敛.
> 3. 从数据中看机会
>    1. 在小数据里看大机会，从个性需求中抽象出共性需求,看到了别人忽略的小痛点，或者在别人不去排查的小异常上执着探索，才最终跨越了现实的障碍
>    2. 在大数据里看小机会，靠数据来打磨用户体验。也就是通过数据分析找到机会点，然后通过产品和技术的改进，不断提升转化减少损失
> 4. 根据机会或者需求本身画出用例
>    1. 核心场景的核心用例,
> 5. 对目标和手段是否匹配进行相关验证
>    1. 如果线上可以A/B TEST,看是否有最小代价做测试，在得到小规模数据后做相关验证
>    2. 如果不能需要通过线下数据看能否用数据公式推导证明，然后再确定具体路径





### 2.2.非功能分析

> 非功能约束,通过业务数据的预估来识别相关约束.

#### 2.2.1.技术

> 技术分析,也是提出技术目标的分析过程.
>
> 1. 可用性,代表业务的底线,在已有业务形态下迭代,要充分考虑现有需求对已有业务的在稳定性的影响.
> 2. 性能,代表假如业务飞轮规模化后,是否承接主用户巨大的流量,对业务的规模化有重大作用
> 3. 可拓展性,代表代码设计中需要考虑未来的拓展点
> 4. 可观测性,代表业务上线后,如何提升线上运维效率,降低人员投入

##### 2.2.1.1.可用性

> 可用性可量化的指标,是重要的稳定性指标,吃饭的家伙事
>
> | 可用性级别 | 系统可用性% | 宕机时间/年 | 宕机时间/月 | 宕机时间/周 | 宕机时间/天 |
> | :--------: | :---------: | :---------: | :---------: | :---------: | :---------: |
> |   高可用   |   99.99%    | 52.56 分钟  |  4.38 分钟  |   1.01 秒   |   8.64 秒   |
> |  极高可用  |   99.999%   |  5.26 分钟  |  26.28 秒   |   6.06 秒   |   0.86 秒   |
> 
> 面向失败的架构设计原则:<br>容灾(主备切换,同城多活,异地多活)----系统统或项目的位置和部署环境。这包括了地理位置、硬件和软件组件的位置,以及数据的存储和处理地点(Where)<br>
> 容错(强弱依赖,降级熔断,资源隔离)----接口强弱依赖评估,外部接口降级熔断<br>
>容量(稳态容量,尖刺容量,防护流控)----有多少用户？日活/月活有多少,容量需要预估多少
> 
> 面向精细化运维管控原则:<br>可灰度(环境管理,版本控制,灰度策略)<br>
> 可观测(监控告警,日志事件,链路追踪)<br>
>可回滚(配置开关,回滚策略,优雅上下线)

1. 容量评估
   1. 1
2. 容灾评估
   1. 1
3. 容错评估
   1. 1
4. 发布评估
   1. 1

##### 2.2.1.2.性能

> 性能指的是根据业务的用户量和操作次数来评估系统压力,分为写入TPS，读取QPS，和相关RT,在业务要10X时,核心性能指标

1. 写入TPS
2. 读取QPS
3. 系统RT

##### 2.2.1.3.扩展性

>可扩展性是指,系统为了应对将来需求变化而提供的一种扩展能力，理念是为了为架构引入外部适应性,让其更好的发展，保证正确预测变化,完美应对变化,可以提升研发效率
>
>1. 正确的预测变化,核心是业务理解能力;
>   1. 从不同人的视角看业务,如产品,运营,市场等，自己对业务深度认知之后的技术洞察，然后通过这个技术洞察来抽象业务
>   2. 从竞争角度看，站在业务、运营、产品和技术的视角，不断监控和思考竞争对手，然后用技术手段做出应对方案
>2. 完美的应对变化,在高速响应业务与技术的需求交付压力一直存在，一般有以下几个原则;
>   1. 单一职责，指的是要把每个业务尝试尽量封装到一个单一模块中,在业务不合预期下，下掉相关代码。
>   2. 最小依赖,整体架构设计要保障大多数业务尝试可以在业务层完成,避免拉入更多的业务导致风险扩散.
>   3. 最小数据共享.个正在尝试中的业务应该尽量减少与其他业务模块的数据交换，尤其是输出，这样才能最小化它的爆炸半径
>   4. 最小暴露,在业务尝试期接口不对外部暴露，包括 API、数据共享、事件、消息流等一切对外界造成影响的通信机制
>   5. 在实现层面，分层架构,领域模型架构，单模块代码层面做微内核可插拔架构

1. 抽象变化
2. 应对变化

##### 2.2.1.4.可观测性

> 可观测性单独拉出来,是因为业务上线后,我们耗费了大量的人力来运维系统,在故障发生后,我们也需要按照1/5/10的标准来处理，因此需要我们在需求上发现出来.核心提升大家线上运维效率,提升生活质量
>
> 1. 日志,毫无遗漏地记录信息,格式统一，内容恰当,日志不应该过多，避免打印敏感信息/避免引用慢操作,但也不应该过少,如系统运行过程中的关键事件,启动时输出配置信息,处理轻轻的TraceId,
> 2. 指标,分为业务指标和技术指标,需要提前拟定好,同时也要区分指标的相关埋点定义,如是计数Counter/瞬态Gauge/吞吐率Meter/直方图Histogram/采样点分位图度量器QuantileSummary
> 3. 告警,在指标定义的基础上，C端一般影响用户数，影响的GMV，B端影响时长等等等来找到告警和故障的定义值
> 4. 预案,从架构上我们面向错误编程,因此需要在告警的基础上，架构中嵌入开关，在业务有损的情况下，降级或者关闭某些功能从而让更多的用户可以被我们服务

1. 日志
   1. 1
2. 指标
   1. 1
3. 告警
   1. 1
4. 预案
   1. 1

#### 2.2.2.成本

>成本是消耗的资源,每个人要有经营意识,这里主要是固定成本,在降本增效的前提下,核心考量

1. 公共云服务分析
2. 存储成本分析
3. 机器成本分析
4. 固定成本的目标

#### 2.2.3.安全

>在架构安全上一般依靠运营商或者云服务商强大的带宽和流量清洗的能力,在功能安全XSS 攻击、CSRF 攻击、SQL 注入一般依赖安全团队提供的二放功能包，现阶段我们主要考虑业务架构上如恶意刷单,刷接口等,防止资产损失.

1. 

#### 2.2.5.其它

> 其它未列明的需求相关



## 3.概要设计

> 架构选型主要是根据需求分析的相关项完成选型和决策.
>
> 1. 领域模型建模,通过领域模型建模完成问题域的定义过程
> 2. 方案选型,核心关注影响全局架构,尤其是领域模型之间交互的选型
> 3. 架构决策,根据上面从各个维度来判断架构整体的优缺点.

### 3.1.领域模型

> 领域模型,可参考[C4_Model](https://c4model.com/)  使用C4-plantuml绘画,属于L1级别,抽象过程是个启发式发现的过程,在文档成型之前,需要和各个方线下one one讨论，这个其实是个思考实验和讨论的过程,文档成型后,只是个再次确认的过程.
>
> 1. 发现不同的语境,通过用例分析,我们已经发现每一个交互场景其实都存在着多个角色，每个角色都有自己的独立语境,这些是我们分析的基础.
> 2. 定义概念,在过程中,我们需要和不同的参与方进行讨论,然后通过准确定义概念来发现不同语境之间的差异点。最后再试图把多个概念放在一起，看它们是否能完全自洽，同时这个过程，我们需要不断修正自己下的定义。如此循环往复，来螺旋式提升你跟参与方的认知.
> 3. 语义建模,当完成了单个概念的定义后，就需要把不同概念引入到同一个语境中，也就是将两个不同的语境进行合并,其实大多数领域都有相对成熟的工业标准，并不需要发明创造太多的概念。我们需要做一次彻底的线上调研，看看是否已经有工业和事实标准存在.同时根据自己的理解完善建模过程.
> 4. 反馈修正,当我们把领域模型定义清楚以后,需要再次和参与方进行相关确认.并循环往复

 ![](https://www.plantuml.com/plantuml/proxy?src=https://raw.githubusercontent.com/nxnnxn/community-doc/main/puml/content/post/system.puml&fmt=svg&cache=no)

1. 

### 3.2.方案选型

> 方案选型过程中,需要注意以下几项
>
> 1. 在当前的业务场景下,架构简单合适,可演化,重点说可演化,其实从商业模式可以看到技术未来,竞争对手哪些商业模式我们是因为什么才取得成功，是成本、规模效应、增速等等不同角度，再思考我们要不要留有抽象的空间，如果把握不准，切记蛮干，防止过度设计
> 2. 采用多个备选方案， 3 ~ 5 个为最佳，这样能扩大的思考面，同时降低思考的爆炸半径;;多种方案之间的差异要比较明显,这样有利于采用不同的角度来思考问题。
> 3. 技术不要只局限于已经熟悉的技术,对于新技术可以适当的做探索.可从业界标准的制定中看新技术,如CNCF各项标准的制定，同时也要注意新技术属于经有规模优势，或者是即将具有规模优势,不至于让自己掉入坑中.
> 4. 方案不要过于详细,容易让大家的判断陷入大量的细节里，也大量耗费了自己的精力.

#### 3.2.1.方案A

 

#### 3.2.2.方案B



#### 3.2.3.方案C



### 3.3.架构决策

> 列出我们需要关注的质量属性点，然后分别从这些质量属性的维度去评估每个方案，再综合挑选适合当时情况的最优方案。常见的方案质量属性点有：性能、可用性、硬件成本、项目投入、复杂度、安全性、可扩展性等。在评估这些质量属性时，需要遵循架构设计原则1“合适原则”和原则 2“简单原则”，避免贪大求全，基本上某个质量属性能够满足一定时期内业务发展就可以了。

| 维度     | 方案A | 方案B | 方案C |
| -------- | ----- | ----- | ----- |
| 可靠性   |       |       |       |
| 性能     |       |       |       |
| 复杂度   |       |       |       |
| 成本     |       |       |       |
| 可运维   |       |       |       |
| 人力投入 |       |       |       |



### 4.详细设计

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



### 4.5.横向概念

#### 4.5.1.接口定义

> 需要引入其他文档,直接使用.proto文件,通过proto文件可快速生成对接文档

#### 4.5.2.消息定义

> 该系统的相关消息定义

#### 4.5.3.配置相关

1. 动态配置
2. 降级配置
3. 预案配置
4. 机器人配置

#### 4.5.4.数据及埋点

1. 技术埋点
2. 业务埋点

## 5.排期规划

### 5.1.任务估时

> 这里主要确定任务时间,让大家任务耗时确定下来

| 需求 | 功能点 | 任务 | 估时 | 人员 | 备注 |
| ---- | ------ | ---- | ---- | ---- | ---- |
|      |        |      |      |      |      |
|      |        |      |      |      |      |
|      |        |      |      |      |      |

### 5.2.排期计划

> 这里主要确定排期和各个相关里程碑，以保证最小交付

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

1. 

## 6.项目实施

> 链接到项目实施的纪录中

 



## 7.业务复盘

> 待项目上线后,针对当前的业务判断和技术判断做关业务复盘,有利于下一次的业务的迭代,链接到其它地方
