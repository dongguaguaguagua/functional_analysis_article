#import "template.typ": *
#import "@preview/cetz:0.3.0"

#set quote(block: true)

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "弧面上的泛函",
  subtitle: "—— 最速降线问题的历史与解法",
  authors: (
    "dgg",
  ),
  class: "1",
  affiliation: "xx university",
  other: ("", "Powered by " + link("https://typst.app")[Typst],"")
)

#outline(indent: auto)

#pagebreak()

= 问题的背景

== 最速降线问题概述

我们知道，在垂直的情况下，一个小球从A点落到B点的最短路径一定是条垂线。但如果B点不再A点的正下方呢？先垂直降落后再水平面移动显然是不合理的，因为小球在水平面并没有受力。如果沿着从A到B的直线滚落看起来很合理，虽然小球经过的路程最短，但较短较平稳的路线让小球受到重力沿斜面上的力减小，从而影响到了它的速度。事实也表明某些曲线上小球所需的时间更短。

那么，如何找到这个曲线呢？这个问题被称为*最速降线问题*，又称最速落径问题。它的严格表述如下:@wuli_brachi

#quote[在一个竖直平面上任意取两个不同的点 $P_1,P_2$ ，$P_1$ 的高度大于等于 $P_2$。一个静止的质点在 $P_2$ 处释放，在恒定的重力的作用下沿某曲线 $cal(L)$ 的轨道无摩擦地运动到 $P_2$，耗时为 $t$。若一条曲线 $cal(L)$ 使得 $t$ 最短，那么这个曲线就是 $P_1,P_2$ 两点间的最速降线 (brachistochrone) ]

== 问题的起源

最速降线问题最早由伽利略于1630年在《关于托勒密和哥白尼两大世界体系的对话》(Dialogo sopra i due massimi systemi del mondo, tolemaico e copernicano)中提出的。这本书不仅系统性地诠释了托勒密理论的谬误、广泛地传播了日心说，还首次提出了最速降线的问题的雏形：一个物体在 $1/4$ 圆弧上滑动的时间永远比在连接这个圆弧的弦上滑动的时间要短一些。此外，在更短的圆弧上的任意两点也满足上述情况。这个结论无疑是正确的，伽利略洞察到了最短路径并非需要的时间最短这一事实。

在1638年出版的《关于两门新科学的对话》(Discorsi e dimostrazioni matematiche intorno a due nuove scienze)中，伽利略进一步提出了该问题的推广版本：从任意一个点到另一个点的最短下降路径。关于这个问题的推理，他写道：

#quote[从一个点到另一个点的最快下降路径不是最短的路径，即一条直线，而是一个圆弧。…… 因此，内接多边形越接近一个圆圈，从A下降到C所需的时间越短。对于小象限，已证明的象限也适用，推理是一样的。]

与前一本书的结论相同，他认为这条曲线是一个圆弧。

时间来到1696年，60年后的约翰·伯努利同样关注到了这个问题，他将这条曲线称为brachistochrone，源自希腊语βρàχιστοʂχρòνοʂ。其中“brachisto”在拉丁语中的含义是“最短的”，“chronos”的含义是“时间”。由此这条曲线得名“最速降线”。@wolfram_brachi

== 伽利略的谬误

伽利略是一个伟大的科学家，物理学的先驱者，但他关于这个问题的结论是错误的。

一方面他受到先验知识的影响，认为圆是神圣无暇的。这一思想受古希腊人的影响，他们将圆视为理性和几何学的象征，认为圆是最完美的几何形状。此外，同时代开普勒的工作得到天体运行的轨迹是圆或椭圆，可能使得他认为完美的运动与圆有关。

另一方面，伽利略的时代微积分等数学工具还没有出现，这个问题的难度显然是超越时代的。直到牛顿和莱布尼茨发明微积分后这个问题才得到解决。正如后来的约翰·伯努利评价的一样：@bernoulli_judge

#quote[“尽管伽利略毫无疑问是他同时代最具洞察力的人物,然而由于缺乏新的分析工具,才使得这样一位伟人做出了悬链线是一条抛物线、最速降线是一段圆弧此类错误猜测.”]

伽利略将折线的时间短于弦的规律取极限，推广至处处折线，即曲线为圆弧的情形。但他的工作仅仅局限于圆弧，并没有考虑其他曲线。这样的遗憾也为这个问题的发展提供了发挥的空间，后人在此基础上创造了变分学，这个问题作为第一个变分法问题，在变分学的发展中起到了至关重要的作用。

== 几何学家的海伦——旋轮线

#quote[“这是一条有着许多奇异之处的曲线，数百年来一直吸引着数学家们的目光。在一个多世纪的时间里，摆线引发了太多的是非、争吵和争斗，所以它被称为几何学的海伦。”@athlon_be ]

#figure(
  image("摆线.png", width: 60%),
  caption: [摆线与圆]
)


摆线(cycloid)，又称旋轮线。它是一个美妙的形状，也是这个问题的答案。摆线被定义为“一个圆无滑动地沿一条直线滚动时，其边上一点运动的轨迹。” @wiki_cycloid 究竟是谁最先发现它、研究它，这一点众说纷纭。有人认为是给毕达哥拉斯写传记的人伊安布利霍斯(Iamblichus，公元前245-公元前325年)，也有人认为是德国的尼古拉斯-库萨(Nicholas of Cusa，公元1401-1464)、法国人Charles de Bovelles(1475-1566)，意大利人伽利略(Galileo Galilei，1564-1642)、法国人马林·梅森(Marin Mersenne，1588-1648)等等。@ry_cycloid @ry_medium 

由于摆线奇妙的性质，它吸引了历史上一众伟大的数学家，包括笛卡尔、费马、帕斯卡、牛顿、莱布尼茨、洛必达、伯努利、欧拉、拉格朗日等等。其中法国数学家帕斯卡(Blaise Pascal)最先创办了一个关于摆线重心、面积以及体积的比赛，并且设有奖金。但遗憾的是没有人在竞赛中获胜，最终收上来的两份答卷被认为是不足以获奖的@wiki_cycloid。比赛期间，克里斯托弗·雷恩(Christopher Wren)提交上了一份关于摆线弧长的证明，虽然不是比赛的要求内容，但仍被 Wallis 发表在《逻辑哲学二重奏》(Tractatus Duo)上。

此后，摆线也经常挑起数学家们的纷争，他们为谁是摆线的性质的发现者而争论，也举办过挑战。下面关于最速降线的比赛也是其中的一个。因此摆线被称作“几何学家的海伦”。

= 发展历史

事实上，伽利略之后的人们已经意识到这个错误，甚至伽利略自己承认存在“可能的谬误”，以及需要更高等的数学工具来解决这个问题。

== 新问题 —— 向数学家们征解

摆线的闻名于世要归功于约翰·伯努利，他敏锐地察觉到了费马原理与最速降线之间的关系，最终使用了斯涅尔定律优雅地解决了这个问题。随后，他向数学界宣称自己已解决了最速降线的问题，但不会先发表，而是发布一个挑战。他在 1696 年 6 月的《教师通报》(Acta Eruditorum) 上，以“新问题 —— 向数学家们征解”为题，写道 @antkiller_brachi

#quote[“我，约翰·伯努利，想找到世界上最出色的数学家。对聪明人而言，没有什么能比一道诚实而富有挑战性的难题更有吸引力，其可能的解决方案将会成为一个永恒的纪念碑。按照帕斯卡，费马等人设定的例子，请允许我代表整个数学界将这个尤其能在今天考验大家的数学技巧和思维耐力的问题展示在最优秀的数学家面前。如果有人能把答案递交与我，我会将其公开，并授予其应得的奖赏。”]

他将问题表述为：@bernoulli_problem

#quote[给定垂直面上的两个点 A 和 B,一个质点 M 受重力作用,从 A 点开始,在最短的时间内到达 B 点, 曲线 AMB 会是怎样的? ”]

约翰原定在挑战的结束时间是1696年年底，但在年底他只收到了一份解答，就是他导师莱布尼兹的。同时，莱布尼兹还在信里要求约翰将截止期限延长到1697年复活节（大致在3月下旬到4月下旬之间），以便留给数学家充足的时间完成这个挑战。

== 伯努利家族：兄弟之间的恩怨

约翰·伯努利和雅各布·伯努利(Jakob Bernoulli‎,1654－1705年)都是瑞士著名数学家族伯努利家族的一员，而雅各布则是约翰的亲哥哥。雅各布毕业于巴塞尔大学，1671 年 17 岁时获艺术硕士学位，1687 年，雅各布成为巴塞尔大学的数学教授。雅各布的辉煌成就深刻地影响了约翰，使得他也开始从事数学研究。约翰于 1694 年取得了巴塞尔大学的博士学位，距离他提出挑战不过两年。

童年时父亲对雅各布的偏爱促成了约翰偏激、好胜、重名利的性格，他迫切地想要在任何方面超越他的哥哥。在1701年约翰写给父亲的信中，他写道：“我从没收到过父亲的信，这说明你更喜欢哥哥们，对我没有感情。我真的不值得像哥哥那样被关心么?……你不允许我过自己想过的生活，而我已经将自己置于神的引导下。所以，请你不要来巴塞尔带走我的名誉，并说你与之毫无关系。” 

约翰在马塞尔大学期间，读遍了当时数学家的成果，将自己视为自学者。然而，哥哥雅各布却始终将约翰视作是自己的学生，这不仅激发了约翰的好胜心，还愈发地憎恨雅各布。他曾在1696年给洛必达的信里写道：“你不会相信，我这个哥哥是多么名不副实。他恨我，迫害我，试图摧毁我….他看上去对我温和友好，心里却暗藏毒药。”@brothers_conflict 两人的矛盾最初究竟从何处产生已经无从可考，但从悬链线问题到船帆形状问题，矛盾在争论中逐步激化。可以说最速降线的挑战就是约翰给雅各布的挑战。

== 一份来自英国的匿名解答

除了雅各布以外，英国数学家艾萨克牛顿也是约翰嫉恨的对象之一。约翰在挑战信里写道 @sujianlin_brachi

#quote[很少有人能解出我们的独特的问题，即使那些自称通过特殊方法……不仅深入探究了几何学的秘密、而且还以一种非凡的方式拓展了几何学领域的人，这些人自以为他们的伟大定理无人知晓，其实早已有人将它们发表过了]

这里提到的“伟大定理”显然是指微积分。牛顿自称在莱布尼兹发表微积分论文之前便已发现了该理论，并将其取名为“流数术”。为此两人产生了旷日持久的争论，矛盾也日益激化。而约翰作为莱布尼兹的学生，自然对这位英国数学家深恶痛绝，于是他亲自抄录了一份挑战信寄往英国的牛顿。

据牛顿的外甥女凯萨琳所述，1697年1月29日牛顿时任英国皇家铸币局副局长，在忙完本职工作后于下午4点回到家中。阅读完约翰的来信后牛顿彻夜未眠地投入研究，并在次日凌晨4点得到了问题的解答。他将他的解答寄给了皇家协会主席查尔斯，随后以匿名的形式将之发表在《哲学汇刊》(Philosophical Transactions)上，显然牛顿不愿意以正常的方式参加这次挑战。

然而在阅读该解答时，约翰立即认出了它的作者，就如同从利爪中认出雄狮一样("recognizes a lion from his claw mark") @wiki_cycloid。

== 答案的公布

1697年复活节的截止期限，伯努利共收到了5份答案。其中包括他哥哥雅各布伯努利、他的导师莱布尼兹、他的学生洛必达和牛顿的匿名解答。其中除了洛必达的答案外，其他人的解答都在1697年5月5月的《博学通报》上公布。

这5份答案中，雅各布的方法使用了二阶微分，体现了原始的变分思想。而牛顿和莱布尼兹则使用了微积分。

== 后续发展

20年后，欧拉作为约翰的学生，重新审视了这一问题，他发现师伯雅各布的方法最具有潜力，他将这一方法进行推广，发展出来变分法(the calculus of variations)，可以求出范围更广的泛函的极值。此后拉格朗日总结出来最小作用量定理，即自然是极值的(nature is extremal)，进一步总结出了欧拉-拉格朗日方程，为变分学的发展奠定了基础。

= 解决过程

== 约翰·伯努利的解法

=== 费马原理

费马原理(Fermat's principle)被法国数学家费马于1662年提出，具体指的是：光总是选择耗时最短的路径。费马原理是几何光学的基本定理，这个原理可以导出三个光传播的定律：

1. 光线在真空中的直线传播。
2. 光的反射定律-光线在界面上的反射，反射角必须等于入射角。
3. 斯涅尔定律(Snell's law)。

其中斯涅尔定律是约翰推导过程中的关键。@yang_brachi

=== 斯涅尔定律

已知光在不同介质中的传播速度不同，由费马原理，光在一个介质到另一个介质时并不会直线传播。这也是我们经常观测到的折射现象。斯涅尔定律探讨了光入射角与折射角之间的关系。
#figure(
  cetz.canvas({
  import cetz.draw: *
  let x = 4
  let a = 3
  grid((0, -a), (x + 1, a), step: 0.5, stroke: gray + 0.2pt)
  anchor("X", (x/2, 0))
  content("X", [$bold(x)$], anchor: "north", padding: .1)
  anchor("A", (0, a))
  content("A", [$A$], anchor: "east", padding: .1)
  anchor("B", (x + 1, -a))
  content("B", [$B$], anchor: "west", padding: .1)
  anchor("O", (0, 0))
  content("O", [$O$], anchor: "east", padding: .1)
  anchor("P", (x, 0.2))
  content("P", [$P$], anchor: "west", padding: .1)
  anchor("beta", (x, -1.5))
  content("beta", [$text(#orange, beta)$], anchor: "west", padding: .1)
  anchor("l1", (x/2, a/2))
  content("l1", [$l_1$], anchor: "south", padding: .2)
  content("l1", text(blue)[$ v_1 $], anchor: "north", padding: .2)
  anchor("l2", (x+1/2, -a/2))
  content("l2", [$l_2$], anchor: "west", padding: .2)
  content("l2", text(blue)[$ v_2 $], anchor: "north", padding: .6)
  anchor("equation", (x + 3, a - 2))
  content("equation", text(black)[Snell's law], anchor: "south", padding: .1)
  content("equation", $ text(#orange, sin alpha) /text(#blue, v_1) = text(#orange, sin beta) /text(#blue, v_2) $, anchor: "north", padding: .1)
  line((0, 0), (x + 1, 0), mark: (end: ">")) // x
  content((), $ x $, anchor: "west", padding: .1)
  line((0, -a), (0, a + 1), mark: (end: ">")) // y
  content((), $ y $, anchor: "south", padding: .1)
  line((0, a), (x, 0), stroke: red + 1.2pt, name: "l1", mark: (end: "straight")) // l1
  line((x, 0), (x + 1, -a), stroke: red + 1.2pt, name: "l2", mark: (end: "straight")) // l2
  line((x, a), (x, -a), name: "dotline",stroke: (dash: "dashed"))
  cetz.angle.angle("l1.end", "l1.start", "dotline.start", label: $ text(#orange, alpha) $, radius: 1)
  cetz.angle.angle("l2.start", "l2.end", "dotline.end", radius: 1)
}),
caption: [斯涅尔定律]
)


已知光在上方传播速度为 $v_1$ 下方传播速度为 $v_2$，我们需要求出 $x$，使得光从A点到B点所需的时间最短。于是我们可以列出需要最小化的时间 $T$:

$ T=l_1/v_1 + l_2/v_2  = sqrt(x^2+a^2)/v_1 + sqrt(x^2+b^2)/v_2 $

对 $x$ 求导，可以得到：

$ (dif T)/ (dif x) = x/(v_1 sqrt(x^2+a^2))-(d-x)/(v_2 sqrt((d-x)^2)+b^2) $

于是当 $T$ 取极值时，有

$ x/(v_1 sqrt(x^2+a^2)) = (d-x)/(v_2 sqrt((d-x)^2)+b^2) $

又 $sin alpha = x\/sqrt(x^2+a^2), sin beta = (d-x)\/(sqrt((d-x)^2)+b^2)$, 得到 $alpha$ 与 $beta$ 的关系

$ (sin alpha)/v_1 = (sin beta) / v_2 arrow.l.r.double.long (sin alpha)/(sin beta) = v_1/v_2 $

这样就得到了斯涅尔定律。

=== 求解最速降线

那么如何利用斯涅尔定律解出最速降线呢？约翰巧妙地将重力场看作是处处不均匀的介质，想象光从起点到终点的路径，会发现在速度 $v$ 不断变化的过程中，光在每个点都遵从斯涅尔定律。

#figure(
  cetz.canvas({
  import cetz.draw: *
  let Y = 5
  let X = 10
  let (x,y,dy,dx) = (1, 2, 0.5, 0.5)
  let (A, G, D, K, O) = ((0, 0),(X, 0),(0, -Y),(X, -Y),(X,-Y/2))
  // let (C,M,c,n,m) = ((0,-y),(x, -y),(0,-y - dy),(x,-y - dy),(x + dx,-y - dy))
  let (C,O) = ((0,-y),(X,-y))
  let (c,o) = ((0,-y - dy),(X,-y - dy))
  let bezierP = (2, -Y)
  intersections("CO-AK", {
    line(C,O,stroke: (dash: "dashed"))
    bezier(A,K,bezierP)
  })
  intersections("co-AK", {
    line(c,o,stroke: (dash: "dashed"))
    bezier(A,K,bezierP)
  })
  let M = "CO-AK.0";let m = "co-AK.0"
  let n = (1.21, -y - dy)
  let v_s = (1,-1);let v_e = (2,-1.9);let v_m = (1.5,-1.6);let v = (1.6,-1.5)
  bezier(v_s,v_e,v_m,mark: (end: "straight"),stroke: blue + 1.2pt)
  anchor("v", v);content("v", $text(#blue, v)$, anchor: "south", padding: .2)
  grid((0, -Y), (X, 0), step: 1/2, stroke: gray + 0.2pt)
  anchor("A", A);content("A", $A$, anchor: "east", padding: .1)
  anchor("D", D);content("D", $D$, anchor: "east", padding: .1)
  anchor("K", K);content("K", $K$, anchor: "west", padding: .1)
  anchor("G", G);content("G", $G$, anchor: "west", padding: .1)
  anchor("O", O);content("O", $O$, anchor: "west", padding: .1)
  anchor("M", M);content("M", $M$, anchor: "south", padding: .2)
  anchor("C", C);content("C", $C$, anchor: "east", padding: .1)
  anchor("c", c);content("c", $c$, anchor: "east", padding: .1)
  anchor("n", n);content("n", $n$, anchor: "north", padding: .1)
  anchor("m", m);content("m", $m$, anchor: "north", padding: .1)
  anchor("y", (X/2, 0));content("y", $y$, anchor: "south", padding: .2)
  anchor("x", (0, -y/2));content("x", $x$, anchor: "east", padding: .1)
  anchor("dx", (0.6, -y - dy / 2));content("dx", $text(#red, dif x)$, anchor: "west", padding: .1)
  anchor("dy", (1.5, -y - dy / 2 - 0.6));content("dy", $text(#red, dif y)$, anchor: "north", padding: .1)
  line(A,D);line(A,G);line(G,K);
  bezier(A,K,bezierP,name: "bezier_curve", mark: (end: "straight"))

  circle(M, radius: 0.1,fill: blue)
  line(M,n);line(n,m)
  }),
  caption: [最速降线上的点]
)

在曲线中任取一点 $M$，设 $M$ 与 $A$ 的距离 $A C$ 为 $x$，$A G$ 为 $y$。在 $M$ 点处取足够小的 $M n$(记为 $dif x$) 与 $m n$(记为 $dif y$)，那么 $M n m$ 就可以被近似看作是三角形，在这个小三角形中便可运用斯涅尔定律。

$ (sin theta)/v = 1/a arrow.r.double sin theta = v/a $

其中 $a$ 为常数，$v$ 是质点经过 $M$ 的瞬时速度。$angle  n M m$ 为 $theta$。两边平方得：

$ dif y^2 = v^2/a^2 (dif x^2 + dif y^2) = v^2/a^2 dif x^2 + v^2/a^2 dif y^2 $

于是可得

$ dif y^2 = v^2/(a^2-v^2) dif x^2 arrow.r.double (dif y)/(dif x) = v/sqrt(a^2-v^2) $

瞬时速度 $v$ 是会随着距离 $x$ 的变化而变化的，即 $v=sqrt(2 g x)$ 于是可以得到

$ (dif y)/(dif x) = sqrt(x/(a^2 \/ 2 g + x)) dif x $

这是摆线的微分方程，描述的是直径为 $a\/sqrt(2g)$ 的圆产生的摆线。

== 雅各布·伯努利的解法

在17世纪末，微分工具刚刚崭露头角，其中一阶微分是数学家常用的工具。但雅各布在这里创新性地使用了二阶微分，这是相对有争议的，但这也体现出了原始的变分思想，为后来欧拉的成果打下基础。

首先，雅各布使用了一阶微分，考虑曲线上足够小的一段弧 $dif s$，它在 $x$ 轴上的投影长度是 $dif x$，在 $y$ 轴上的投影长度是 $dif y$。由于是足够小的，那么曲线就可以被近似成直线，于是由勾股定律：

$ dif s^2 = dif x^2 + dif y^2 $

控制 $dif y$ 不变，对上式进行二次微分，可以得到：

$ 2 dif s dif ^2 s = 2 dif x dif ^2 x arrow.r.double (dif x)/(dif s) dif^2 x = dif^2 s $

再由 $dif s = v dif t$ 的二次微分 $dif^2 s = v dif^2 t$ 可得

$ (dif x)/(dif s) dif^2 x = v dif^2 t $


#figure(
  cetz.canvas({
  import cetz.draw: *
  let Y = 4
  let X = 10
  grid((0, -Y), (X, 0), step: 1/2, stroke: gray + 0.2pt)
  let dx2 = 2
  line((0,0),(X,0));line((0,-Y/2),(X,-Y/2));line((0,-Y),(X,-Y));
  let (A,B,C,D,E,F) = ((1,0),(X/2,-Y/2),(X - 1,-Y),(1,-Y/2),(X/2 + dx2, -Y/2),(X - 1,-Y/2))
  line((0,.5),B);line(B,(X,-Y - .5))
  line(A,D);line(C,F)
  line(A,E,stroke: (dash: "dashed"),name: "AE");line(E,C,stroke: (dash: "dashed"), name:"EC")
  anchor("dy1", (1,-1));content("dy1", $dif y_1$, anchor: "east", padding: .1)
  anchor("dx1", (1/2 + (X/2 + dx2)/2, -Y/2));
  // content("dx1", $dif x_1$, anchor: "north", padding: .1)
  content(("AE.start",50%,"AE.end"), angle: "AE.end", $dif s_1$, anchor: "south", padding: .1)
  anchor("dy2", (X - 1,-Y + 1));content("dy2", $dif y_2$, anchor: "west", padding: .1)
  anchor("dx2", (X - 2, -Y/2));content("dx2", $dif x_2$, anchor: "south", padding: .1)
  content(("EC.start",50%,"EC.end"), angle: "EC.end", $dif s_2$, anchor: "south", padding: .1)
  cetz.decorations.flat-brace(B,E,name:"brace_1")
  cetz.decorations.flat-brace(E,D,name:"brace_2")
  content("brace_1", $text(#red,dif^2 x)$, anchor: "south", padding: .3)
  content("brace_2", $dif x_1$, anchor: "north", padding: .3)
}),
caption: [雅各布方法]
)
现在设想另一条路径：在原路经上做一段微小的偏差 $dif^2 x$，新路径被水平分为上一段和下一段。对于上一段路径我们将弧长与速度记为 $dif s_1$ 与 $v_1$，下一段路径则是 $dif s_2$ 与 $v_2$。那么它们的时间的微增量可写为

$ dif^2 t_1 = 1/v_1 (dif x_1)/(dif s_1) dif^2 x, dif^2 t_2 = 1/v_2 (dif x_2)/(dif s_2) dif^2 x $

由于这是时间最短的路径，故两个时间相等，即有

$ dif^2 t_2 - dif^2 t_1 = 0 arrow.long.double (1/v_2 (dif x_2)/(dif s_2) - 1/v_1 (dif x_1)/(dif s_1)) dif^2 x = 0 $

由于 $dif^2 x eq.not 0 $，可以得到

$ 1/v_1 (dif x_1)/(dif s_1) = 1/v_2 (dif x_2)/(dif s_2) $

这正是斯涅尔定律的条件，从这个条件入手便可以和约翰的方法类似算出摆线的微分方程了。

== 欧拉的解法

欧拉在研究这一问题的过程中，进一步推广了雅各布的方法，发展出了现代意义上的变分学。因此欧拉的解法可以说是现代版本的解答 @travor_brachi @hellgirl_euler。

=== 从泛函分析的角度考虑

下面，我们来用现代的眼光重视一下这个问题。如果将质点经过的路径看作是一个函数 $y$，那么它一定是连续有界的。假设终点的位置在 $(x_1,0)$ 处，起点的位置在 $(x_0,h)$ 处，那么 $y$ 就是 $x_0$ 到 $x_1$ 的连续函数，它属于$C[x_0,x_1]$。

我们需要优化的目标则是降落时间 $t in bb(K)$，定义算子 $T$ 使得 $t=T(y)$，则有 $C[x_0,x_1] arrow.r.long^T bb(K)$。那么 $T$ 就是从连续函数空间映射到数域 $bb(K)$ 的泛函。

由时间与路程在微分上的关系

$ T = integral_C (dif s)/v $

利用弧微分公式，可得 $dif s$ 与 $y$ 的关系

$ dif s = sqrt(1+y'^2) dif x $

以及有掉落速度与路程的关系：

$ v=sqrt(2g(h-y)) $

将上面的式子代入，泛函 $T$ 可以写为

$ T = integral_(x_0)^(x_1) sqrt(1+y'^2)/sqrt(2g(h-y)) dif x $

时间 $t$ 与 $y$ 的关系便是

$ t = inf_y T(y) $

=== 欧拉—拉格朗日方程

上面得到的泛函可以简述为

$ T(y) = integral_(x_0)^(x_1) F(x,y,y') dif x $

我们需要找到一个使其取到极值的 $y$。我们定义一个微小变化的函数 $eta$, 满足 $eta(x_0)=eta(x_1)=0$，那么 $y + eta$ 就满足所有的边界条件。令：

$ delta T eq.triple T(y+eta)-T(y) = integral_(x_0)^(x_1) [F(x, y+eta,y'+eta')-F(x,y,y')] dif x $

将 $F$ 在 $F(x,y,y')$ 附近做一阶泰勒展开来估计 $F(x, y+eta,y'+eta')$

$ delta T &= integral_(x_0)^(x_1) [F(x,y,y') + gradient F dot (0,eta,eta')-F(x,y,y')] dif x \ &= integral_(x_0)^(x_1) gradient F dot (0,eta,eta') dif x \ &= integral_(x_0)^(x_1) [(diff F)/(diff y)eta+(diff F)/(diff y')eta'] dif x $

对被积函数里的第二项进行分部积分，可得

$ delta T &= integral_(x_0)^(x_1) (diff F)/(diff y)eta dif x + [(diff F)/(diff y')eta]^(x_1)_(x_0) - integral_(x_0)^(x_1) eta dif/(dif x) (diff F)/(diff y') dif x \ &= integral_(x_0)^(x_1) eta[(diff F)/(diff y) - dif/(dif x) (diff F)/(diff y')] dif x $

由于 $T(y)$ 需要取极值，所以可以不严格地断定此时 $delta T = 0$，当且仅当被积函数在 $(x_0,x_1)$ 上恒为 $0$,即

$ (diff F)/(diff y) - dif/(dif x) (diff F)/(diff y') = 0 $

这就是*欧拉-拉格朗日方程*(Euler—Lagrange equation)的由来。

=== 贝尔特拉米等式

将欧拉-拉格朗日方程移项

$ (diff F)/(diff y) = dif/(dif x) (diff F)/(diff y') $

两侧乘上 $y'$ 并且积分

$
integral (diff F)/(diff y) y' dif x &= integral y' dif/(dif x) (diff F)/(diff y') dif x \
integral (diff F)/(diff y) y' dif x &= y' (diff F)/(diff y') - integral (diff F)/(diff y') y'' dif x \
integral [(diff F)/(diff y) y' + (diff F)/(diff y') y''] dif x &= y' (diff F)/(diff y') + C \
integral (dif F)/(dif x) dif x &= y' (diff F)/(diff y') + C \
F - y' (diff F)/(diff y') &= C
$

于是就得到了贝尔特拉米等式(Beltrami's identity)。

=== 求解问题

有前面的推导中我们可以知道

$ F = sqrt(1+y'^2)/sqrt(2g(h-y)) $

那么 $F$ 关于 $y'$ 的偏导数就是

$ (diff F)/(diff y') = (y')/(sqrt(2g(h-y))sqrt(1+y'^2)) $

将它代入到贝尔特拉米等式，得

$
C &= F - y' (diff F)/(diff y') \
C &= sqrt(1+y'^2)/sqrt(2g(h-y)) - (y')/(sqrt(2g(h-y))sqrt(1+y'^2)) \
C &= (1+y'^2-y'^2)/(sqrt(2g(h-y))sqrt(1+y'^2)) \
C &= 1/(sqrt(2g(h-y))sqrt(1+y'^2)) \
$

将 $y'$ 提出来，两边整理得

$ y' = (dif y)/(dif x) = sqrt(1/(2 C^2 g(h-y))-1) $

于是就得到了摆线的微分方程。



= 总结

从帕斯卡到伽利略，再到17世纪末的诸神之战，再到欧拉与拉格朗日的推广，数学的发展总是离不开问题的提出和工具的革新。

伽利略时代缺乏强有力的分析工具，导致他不得不使用实验的方法研究摆线，在最速降线的问题上给出了错误的答案。但这间接引起了变分学的蓬勃发展，何尝不是未被解决的问题的魅力所在。

约翰·伯努利是一个复杂的人，他天才的头脑下是嫉妒、功力的内心。他是幸运的，因为晚年的他功成名就，同时桃李满园、子孙也有着惊人的成就。他的学生与再传学生几乎推动了整个18世纪数学界的进步，其中包括欧拉、高斯、黎曼和洛必达等等。他也是不幸的，童年的遭遇以及哥哥雅各布的压力下，使他不仅憎恨哥哥雅各布，也嫉妒他的儿子丹尼尔·伯努利，后者在流体力学的成就使他痛苦不已，甚至不惜将儿子赶出家门。约翰发起这场著名的挑战直接促进了变分学的进步，同时让最速降线问题家喻户晓。同时，约翰也预言了更强大的数学工具的提出：@smith1959

#quote[“到现在为止,已经出现了许多处理最大值和最小值的方法,但似乎与此主题之间没有什么微妙的联系,以至于无法被他们的洞察力所参透……即使是那些知名人物,如笛卡尔、费马等,也一定会坦率地承认,他们的权威方法在这里是不充分的……在他们的著作中,我们没有发现对这种类型的极大值和极小值问题的考量,他们并没有将方法普遍化地运用.”]

正如约翰所预感的一样，以欧拉和拉格朗日为代表的十八世纪的数学家们不仅大大拓展了分析的疆域，同时赋予它与几何相对的意义，他们力图用纯分析的手法以摆脱对于几何论证的依赖，这种倾向成为十八世纪数学的另一大特征。简言之，从最速降线问题的解答中，便可以窥得数学从偏几何到偏分析的过渡。

#pagebreak()

#bibliography("works.bib")
