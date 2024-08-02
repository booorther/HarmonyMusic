export interface  songItemType {
  img: string
  name: string
  author: string
  url: string
  id:string
}

export interface recommendListType {
  img: string
  title: string
  count:string
}
export interface recommendDailyType {
  img: string
  title: string
  type:string
  top:string
  bottom: string
}
export interface favoriteListType {
  name:string
  nickName:string
  avatar:ResourceStr
  songs:songItemType[]
}
export interface momentListType {
  author:string
  avatar:string
  content:string
  comment:number
  like:number
  song:songItemType
}
export class songItemTypeModel implements songItemType {
  img: string = ''
  name: string = ''
  author: string = ''
  url: string = ''
  id: string = ''

  constructor(model: songItemType) {
    this.img = model.img
    this.name = model.name
    this.author = model.author
    this.url = model.url
    this.id = model.id
  }
}
export class recommendListTypeModel implements recommendListType {
  img: string = ''
  title: string = ''
  count: string = ''

  constructor(model: recommendListType) {
    this.img = model.img
    this.title = model.title
    this.count = model.count
  }
}
export class recommendDailyTypeModel implements recommendDailyType {
  img: string = ''
  title: string = ''
  type: string = ''
  top: string = ''
  bottom: string = ''

  constructor(model: recommendDailyType) {
    this.img = model.img
    this.title = model.title
    this.type = model.type
    this.top = model.top
    this.bottom = model.bottom
  }
}
export class favoriteListTypeModel implements favoriteListType {
  name: string = ''
  nickName: string = ''
  avatar: ResourceStr = ''
  songs: songItemType[] = []

  constructor(model: favoriteListType) {
    this.name = model.name
    this.nickName = model.nickName
    this.avatar = model.avatar
    this.songs = model.songs
  }
}
export class momentListTypeModel implements momentListType {
  author: string = ''
  avatar: string = ''
  content: string = ''
  comment: number = 0
  like: number = 0
  song: songItemType = new songItemTypeModel({} as songItemType)

  constructor(model: momentListType) {
    this.author = model.author
    this.avatar = model.avatar
    this.content = model.content
    this.comment = model.comment
    this.like = model.like
    this.song = model.song
  }
}