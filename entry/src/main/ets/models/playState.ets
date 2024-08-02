import { songItemType } from './music';
export interface PlayStateType {
  img: string
  name: string
  author: string
  url: string
  playIndex: number
  time: number
  duration: number
  isPlay: boolean
  playMode: 'auto' | 'repeat' | 'random'
  playList: songItemType[]
}
export const defaultState = {
  img:'',
  name: '',
  author: '',
  url: '',
  playIndex: 0,
  time: 0,
  duration: 0,
  isPlay: false,
  playMode: 'auto',
  playList:[]
}
export class PlayStateTypeModel implements PlayStateType {
  img: string = ''
  name: string = ''
  author: string = ''
  url: string = ''
  playIndex: number = 0
  time: number = 0
  duration: number = 0
  isPlay: boolean = false
  playMode: 'auto' | 'repeat' | 'random' = 'auto'
  playList: songItemType[] = []

  constructor(model: PlayStateType) {
    this.img = model.img
    this.name = model.name
    this.author = model.author
    this.url = model.url
    this.playIndex = model.playIndex
    this.time = model.time
    this.duration = model.duration
    this.isPlay = model.isPlay
    this.playMode = model.playMode
    this.playList = model.playList
  }
}