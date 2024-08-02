import { songItemType, recommendListType, recommendDailyType, favoriteListType, momentListType } from '../models'
import { TabClass } from '../models'

// TabBar数据
export const tabsData: TabClass[] = [
  {
    title: '推荐',
    name: 'recommend',
    icon: $r("app.media.ic_recommend")
  }, {
  title: '发现',
  name: 'find',
  icon: $r("app.media.ic_find")
}, {
  title: 'music',
  name: 'home',
  icon: $r("app.media.ic_logo")
}, {
  title: '动态',
  name: 'moment',
  icon: $r("app.media.ic_moment")
}, {
  title: '我的',
  name: 'mine',
  icon: $r("app.media.ic_mine")
}]
// 轮播图数据
export const swiperList: string[] = [
  "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner1.png",
  "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner2.png",
  "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner3.png",
  "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner4.png",
  "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner5.png"
]
// 每日推荐数据
export const dailyRecommend: recommendDailyType[] = [
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/recommend1.png',
    title: '每日推荐 | 今天从《不得不爱》听起 | 私人雷达',
    type: '每日推荐',
    top: '#660000',
    bottom: '#382e2f'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/recommend2.png',
    title: '从 [Nothing on Me] 开启无限漫游',
    type: '私人漫游',
    top: '#382e2f',
    bottom: '#a37862'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/recommend3.png',
    title: '每日推荐 | 今天从《不得不爱》听起 | 私人雷达',
    type: '华语流行',
    top: '#a37862',
    bottom: '#174847'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/recommend4.png',
    title: '每日推荐 | 今天从《不得不爱》听起 | 私人雷达',
    type: '私人雷达',
    top: '#174847',
    bottom: '#174847'
  }
]
// 推荐歌单数据
export const recommendList: recommendListType[] = [
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/list1.jpg',
    title: '每日推荐 | 今天从《不得不爱》听起 | 私人雷达',
    count: '270.9万'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/list2.jpg',
    title: 'Yasuo和更多好听的 | 华语私人雷达 | 回忆8090',
    count: '476.1万'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/list3.jpg',
    title: 'Trap Remix丨当欧美热单遇上毒性低音',
    count: '186.3万'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/list4.jpg',
    title: '满级人类进化之路必备BGM | 根本停不下来',
    count: '186.3万'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/list5.jpg',
    title: '认真去聆听这个世界的每一分每一秒 (强烈推荐)',
    count: '362.8万'
  },


]
// 歌曲列表
export const songs: songItemType[] = [
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/0.jpg',
    name: '直到世界的尽头',
    author: 'WANDS',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/0.m4a',
    id: '0000'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/1.jpg',
    name: '画',
    author: '赵磊',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/1.mp3',
    id: '0001'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/2.jpg',
    name: 'Sweet Dreams',
    author: 'TPaul Sax / Eurythmics',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/2.mp3',
    id: '0002'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/3.jpg',
    name: '奢香夫人',
    author: '凤凰传奇',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/3.m4a',
    id: '0003'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/4.jpg',
    name: '空心',
    author: '光泽',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/4.mp3',
    id: '0004'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/5.jpg',
    name: '反转地球',
    author: '潘玮柏',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/5.mp3',
    id: '0005'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/6.jpg',
    name: 'No.9',
    author: 'T-ara',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/6.m4a',
    id: '0006'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/7.jpg',
    name: '孤独',
    author: 'G.E.M.邓紫棋',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/7.m4a',
    id: '0007'
  },

  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/8.jpg',
    name: 'Lose Control',
    author: 'Hedley',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/8.m4a',
    id: '0008'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/9.jpg',
    name: '倩女幽魂',
    author: '张国荣',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/9.m4a',
    id: '0009'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/10.jpg',
    name: '北京北京',
    author: '汪峰',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/10.m4a',
    id: '0010'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/11.jpg',
    name: '苦笑',
    author: '汪苏泷',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/11.mp3',
    id: '0011'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/12.jpg',
    name: '一生所爱',
    author: '卢冠廷 / 莫文蔚',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/12.m4a',
    id: '0012'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/13.jpg',
    name: '月半小夜曲',
    author: '李克勤',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/13.mp3',
    id: '0013'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/14.jpg',
    name: 'Rolling in the Deep',
    author: 'Adele',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/14.m4a',
    id: '0014'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/15.jpg',
    name: '海阔天空',
    author: 'Beyond',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/15.m4a',
    id: '0015'
  }
]
// 喜欢列表
export const favoriteList: favoriteListType = {
  name: "我喜欢的音乐",
  nickName: "黑马程序员",
  avatar: $r('app.media.logo'),
  songs: songs
}
// 动态列表
export const momentList: momentListType[] = [
  {
    author: 'Feast-aws',
    avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h0.jpg',
    content: '二十几岁的你，一无所有，也拥有一切！',
    comment: 604,
    like: 23382,
    song: songs[0]
  },
  {
    author: 'CeeYet',
    avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h1.jpg',
    content: '画一个姑娘陪着我,再画一个姑娘陪着我',
    comment: 1237,
    like: 5482,
    song: songs[1]
  },
  {
    author: 'Z_HOUSC',
    avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h2.jpg',
    content: '这个事还得从两个职业选手说起',
    comment: 8425,
    like: 4234,
    song: songs[2]
  },
  {
    author: '逆转大师',
    avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h3.jpg',
    content: '听奢香夫人，做上岸女人！',
    comment: 7658,
    like: 11545,
    song: songs[3]
  },
  {
    author: 'Moriaty',
    avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h4.jpg',
    content: '别一厢情愿的付出，他如果拒绝你了就别再纠缠了，别一次次满满热情得到的都是敷衍冷淡的回复，你不该这样的，你应该酷一点，别打扰真的是最好的选择。',
    comment: 543,
    like: 2234,
    song: songs[4]
  },
  {
    author: '丶你要去哪里',
    avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h5.jpg',
    content: '当年会一段潘帅的RAP是很拉风的事情',
    comment: 14415,
    like: 36297,
    song: songs[5]
  },
  {
    author: '一个人的某泥',
    avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h6.jpg',
    content: '抗韩二十年，死于朴智妍',
    comment: 1237,
    like: 5482,
    song: songs[6]
  },
  {
    author: '曾经那个少年1993',
    avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h7.jpg',
    content: '一个人去游泳，像投河；倒过来，一个人去投河，像游泳，太孤独。 ———-陈小三',
    comment: 7628,
    like: 36448,
    song: songs[7]
  },
  {
    author: '柳崽崽阿',
    avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h8.jpg',
    content: '哎呦，B站来的跟我一起摇💃',
    comment: 1237,
    like: 5482,
    song: songs[8]
  },
  {
    author: '李富贵他哥',
    avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h9.jpg',
    content: '我弟弟老是偷我的裙子丝袜穿，我担心他在女装的道路上越走越远，这让我这个当哥哥的很是担心啊',
    comment: 7362,
    like: 11482,
    song: songs[9]
  },
  {
    author: '一檀溪一',
    avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h10.jpg',
    content: '想起张雪峰说过的全世界最大的社区天通苑，住了400w人，光是地铁修了三站，去赶早上第一班天通苑的地铁，那才是真正的北京，真的是哭辽',
    comment: 6496,
    like: 8526,
    song: songs[10]
  },
  {
    author: '-_Dimple_',
    avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h11.jpg',
    content: '今天为了赶地铁在电梯上摔了一跤，手磕破了，马上起来进了地铁结果发现一着急坐反了。某一刻觉得自己长大了，摔倒了不是先难受，想哭觉得丢脸，而是想着快点赶上地铁。大概成年人的无奈就是没时间让我难过一会儿吧。',
    comment: 1237,
    like: 5482,
    song: songs[11]
  },
  {
    author: 'h奔放小青年',
    avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h12.jpg',
    content: '关于这部电影看到过一个评论：当年大学毕业以后我和女友各奔东西，曾经一个晚上，偶然又看了这部电影，当至尊宝拥吻紫霞的时候荡气回肠的歌声也让我潸然泪下。。。。。第二天我打起行囊踏上火车往她家赶，如今十年过去，我们已经有了一个可爱的女儿。 我想，这是对一部电影最好的肯定吧',
    comment: 1237,
    like: 5482,
    song: songs[12]
  },
  {
    author: '您的坑友已上线',
    avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h13.jpg',
    content: '李克勤说他唱了三十多年的歌，当接下面具的时候还很紧张，还很担心自己能不能被大家认出来，然后当《红日》想起来的时候，自己都被感动了。前天看张信哲在央视的开讲啦，坦言面对"过气“一次能够接受，撒贝宁说的很好，这批歌迷也许不会通过刷微博来支持，但是他在这些人的心里比微博上更重要。',
    comment: 1237,
    like: 5482,
    song: songs[13]
  },
  {
    author: '一个人的某泥',
    avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h14.jpg',
    content: '11年初三，无意中听到这首歌，推荐给同学，他们都说一般般。当我在家外放这首歌时，我奶奶对我说：“这什么歌，这么好听。',
    comment: 1237,
    like: 5482,
    song: songs[14]
  },
  {
    author: '一个人的某泥',
    avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h15.jpg',
    content: '文不黑周树人 武不黑李小龙 音不黑黄家驹 影不黑周星驰',
    comment: 1237,
    like: 5482,
    song: songs[15]
  }
]

