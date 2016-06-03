//
//  DeviceInfo.swift
//  RxSwiftLearn
//
//  Created by js on 16/5/31.
//  Copyright © 2016年 js. All rights reserved.
//

import Foundation
import UIKit
import AdSupport

class DeviceInfo{
    class func idfaString() -> String {
        
        if Float(UIDevice.currentDevice().systemVersion) > 6.0{
            let asIdManager = ASIdentifierManager.sharedManager()
            return asIdManager.advertisingIdentifier.UUIDString
        }
        
        return ""
    }
}

