//
//  User.swift
//  RxSwiftLearn
//
//  Created by js on 16/6/1.
//  Copyright © 2016年 js. All rights reserved.
//

import Foundation
import ObjectMapper
/*
 "alert_type" = 0;
 mobile = 18512172835;
 "shop_id" = 21495;
 token = 4cdf60721a8f82fc53979c44a585be65;
 wid = 500000091;
 */
class MDUser: Mappable {
    var mobile: String?
    var shopId: String?
    var token: String?
    var wid: String?
    var imucId: Int64?
    var imucPassword: String?
    var nickName: String?
    
    init(){
        
    }
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map){
        mobile <- map["mobile"]
        shopId <- map["shop_id"]
        token <- map["token"]
        wid <- map["wid"]
    }
}
