//
//  AgoraViewController.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/27/23.
//

import Foundation
import AgoraRtcKit

class AgoraViewController: UIViewController {
    var agoraKit: AgoraRtcEngineKit?
    var agoraDelegate: AgoraRtcEngineDelegate?

    override func viewDidLoad() {
           super.viewDidLoad()
           initializeAgoraEngine()
           joinChannel()
       }
       

    func initializeAgoraEngine() {
          
              
                   agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: "d736f08106704349a7fd2f47fc0a985b", delegate: agoraDelegate)
               
//            agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: "AppIdd736f08106704349a7fd2f47fc0a985b", delegate: agoraDelegate)
        }

        func joinChannel() {
                agoraKit?.joinChannel(byToken: "007eJxTYLATZb2kalT7f7FPfok545rXCS+O/fez59j1Oq3Z4hinxUcFhhRzY7M0AwtDAzNzAxNjE8tE87QUozQT87Rkg0RLC9OkSQY2qQ2BjAwOGqmsjAwQCOKzMJSkFpcwMAAA0WUdSw==", channelId: "test", info: nil, uid: 0, joinSuccess: {(channel, uid, elapsed) in})
            }

        func leaveChannel() {
            agoraKit?.leaveChannel(nil)
        }

    func destroyInstance() {
            AgoraRtcEngineKit.destroy()
        }

    override func viewWillDisappear(_ animated: Bool) {
          leaveChannel()
          destroyInstance()
      }
}
