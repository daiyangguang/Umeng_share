//
//  ViewController.swift
//  Umeng_share
//
//  Created by 随随意 on 17/2/4.
//  Copyright © 2017年 suisuiyi. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func shareAction(_ sender: AnyObject) {
        print("Umeng分享")
        //系统自带的分享面板
//        UMSocialUIManager.showShareMenuViewInWindow { (platformType, userInfo) in
//            
//        }
        //自定义分享面板
        //先做一个分享到新浪微博的例子
        shareToSina()
        
    }
    func shareToSina() {
        let messageObj = UMSocialMessageObject()
//        messageObj.title = "我的微博分享"
//        messageObj.text = "愿无岁月可回头，我想那是人生最好的状态了吧！"
        let thumbURL = "https://mobile.umeng.com/images/pic/home/social/img-1.png"
        let shareMessage = UMShareWebpageObject.shareObject(withTitle: "欢迎使用【友盟+】社会化组件U-Share", descr: "欢迎使用【友盟+】社会化组件U-Share，SDK包最小，集成成本最低，助力您的产品开发、运营与推广！", thumImage: thumbURL)
        shareMessage?.webpageUrl = "http://mobile.umeng.com/social"
        messageObj.shareObject = shareMessage
        UMSocialManager.default().share(to: .sina, messageObject: messageObj, currentViewController: self) { (data,error) in
            if (error != nil) {
                print("************Share fail with \(error) %@*********")
            }
            else {
                print("🐩🐩🐩🐩🐩🐩🐩🐩🐩🐩share succeed")
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

