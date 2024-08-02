import commonEventManager from '@ohos.commonEventManager'
import { PublishEventType } from '../constants/EventContants'

export class SubscriberClass {
  static publishCount: number = 0
  static publish(eventType: PublishEventType, data: string) {
    commonEventManager.publish(eventType, { data }, (err) => {
      //  多发几次，失败继续发送
      if (err) {
        // 发布次数小于3次
        if(this.publishCount<3){
          this.publish(eventType,data)
          this.publishCount++
        }else{
          this.publishCount = 1
        }
      }else{
        // 因为有可能是第二次发送成功，要清空之前发送的次数
        this.publishCount = 1
      }
    })
  }

  static subscribe(eventType:PublishEventType,subscriber,callback:(event:string)=>void) {
    // 1.创建订阅者
    commonEventManager.createSubscriber({events:[eventType]},(err,data)=>{
      if(err){
        return console.log('logData:','创建订阅者失败')
      }
      // 2.data是订阅者
      subscriber = data
      if(subscriber){
        // 3.订阅事件
        commonEventManager.subscribe(subscriber,(err,data)=>{
          if(err){
            return console.log('logData:','订阅者事件失败')
          }
          callback(data.data)
        })
      }
    })
  }
}