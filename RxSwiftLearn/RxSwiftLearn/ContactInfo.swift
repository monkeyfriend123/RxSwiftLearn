//
//	ContactInfo.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class ContactInfo : NSObject, NSCoding, Mappable{

	var area : String?
	var authLevel : String?
	var avatar : String?
	var beenBlack : Int?
	var beenDelete : Int?
	var city : String?
	var createTime : Int?
	var fadePartnerNum : Int?
	var flag : Int?
	var imucUid : Int?
	var isBlackList : Int?
	var location : String?
	var masterShopId : String?
	var name : String?
	var partnerNum : Int?
	var personalDesc : String?
	var phoneNum : String?
	var pinyin : String?
	var pinyinGroup : String?
	var province : String?
	var realPartnerNum : Int?
	var relationType : String?
	var remarkName : String?
	var remarkNamePinyin : String?
	var remarkNamePinyinGroup : String?
	var saleNum : Int?
	var sex : String?
	var shopAuth : Int?
	var shopContribution : String?
	var shopId : String?
	var shopIdT : String?
	var shopKey : String?
	var street : String?
	var title : String?
	var updateTime : Int?
	var wid : Int?


	class func newInstance(map: Map) -> Mappable?{
		return ContactInfo()
	}
	private override init(){}

    
    required init?(_ map: Map){
        
    }
    
	func mapping(map: Map)
	{
		area <- map["area"]
		authLevel <- map["authLevel"]
		avatar <- map["avatar"]
		beenBlack <- map["beenBlack"]
		beenDelete <- map["beenDelete"]
		city <- map["city"]
		createTime <- map["createTime"]
		fadePartnerNum <- map["fadePartnerNum"]
		flag <- map["flag"]
		imucUid <- map["imucUid"]
		isBlackList <- map["isBlackList"]
		location <- map["location"]
		masterShopId <- map["masterShopId"]
		name <- map["name"]
		partnerNum <- map["partnerNum"]
		personalDesc <- map["personalDesc"]
		phoneNum <- map["phoneNum"]
		pinyin <- map["pinyin"]
		pinyinGroup <- map["pinyinGroup"]
		province <- map["province"]
		realPartnerNum <- map["realPartnerNum"]
		relationType <- map["relationType"]
		remarkName <- map["remarkName"]
		remarkNamePinyin <- map["remarkNamePinyin"]
		remarkNamePinyinGroup <- map["remarkNamePinyinGroup"]
		saleNum <- map["saleNum"]
		sex <- map["sex"]
		shopAuth <- map["shopAuth"]
		shopContribution <- map["shopContribution"]
		shopId <- map["shopId"]
		shopIdT <- map["shopId_t"]
		shopKey <- map["shopKey"]
		street <- map["street"]
		title <- map["title"]
		updateTime <- map["updateTime"]
		wid <- map["wid"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         area = aDecoder.decodeObjectForKey("area") as? String
         authLevel = aDecoder.decodeObjectForKey("authLevel") as? String
         avatar = aDecoder.decodeObjectForKey("avatar") as? String
         beenBlack = aDecoder.decodeObjectForKey("beenBlack") as? Int
         beenDelete = aDecoder.decodeObjectForKey("beenDelete") as? Int
         city = aDecoder.decodeObjectForKey("city") as? String
         createTime = aDecoder.decodeObjectForKey("createTime") as? Int
         fadePartnerNum = aDecoder.decodeObjectForKey("fadePartnerNum") as? Int
         flag = aDecoder.decodeObjectForKey("flag") as? Int
         imucUid = aDecoder.decodeObjectForKey("imucUid") as? Int
         isBlackList = aDecoder.decodeObjectForKey("isBlackList") as? Int
         location = aDecoder.decodeObjectForKey("location") as? String
         masterShopId = aDecoder.decodeObjectForKey("masterShopId") as? String
         name = aDecoder.decodeObjectForKey("name") as? String
         partnerNum = aDecoder.decodeObjectForKey("partnerNum") as? Int
         personalDesc = aDecoder.decodeObjectForKey("personalDesc") as? String
         phoneNum = aDecoder.decodeObjectForKey("phoneNum") as? String
         pinyin = aDecoder.decodeObjectForKey("pinyin") as? String
         pinyinGroup = aDecoder.decodeObjectForKey("pinyinGroup") as? String
         province = aDecoder.decodeObjectForKey("province") as? String
         realPartnerNum = aDecoder.decodeObjectForKey("realPartnerNum") as? Int
         relationType = aDecoder.decodeObjectForKey("relationType") as? String
         remarkName = aDecoder.decodeObjectForKey("remarkName") as? String
         remarkNamePinyin = aDecoder.decodeObjectForKey("remarkNamePinyin") as? String
         remarkNamePinyinGroup = aDecoder.decodeObjectForKey("remarkNamePinyinGroup") as? String
         saleNum = aDecoder.decodeObjectForKey("saleNum") as? Int
         sex = aDecoder.decodeObjectForKey("sex") as? String
         shopAuth = aDecoder.decodeObjectForKey("shopAuth") as? Int
         shopContribution = aDecoder.decodeObjectForKey("shopContribution") as? String
         shopId = aDecoder.decodeObjectForKey("shopId") as? String
         shopIdT = aDecoder.decodeObjectForKey("shopId_t") as? String
         shopKey = aDecoder.decodeObjectForKey("shopKey") as? String
         street = aDecoder.decodeObjectForKey("street") as? String
         title = aDecoder.decodeObjectForKey("title") as? String
         updateTime = aDecoder.decodeObjectForKey("updateTime") as? Int
         wid = aDecoder.decodeObjectForKey("wid") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if area != nil{
			aCoder.encodeObject(area, forKey: "area")
		}
		if authLevel != nil{
			aCoder.encodeObject(authLevel, forKey: "authLevel")
		}
		if avatar != nil{
			aCoder.encodeObject(avatar, forKey: "avatar")
		}
		if beenBlack != nil{
			aCoder.encodeObject(beenBlack, forKey: "beenBlack")
		}
		if beenDelete != nil{
			aCoder.encodeObject(beenDelete, forKey: "beenDelete")
		}
		if city != nil{
			aCoder.encodeObject(city, forKey: "city")
		}
		if createTime != nil{
			aCoder.encodeObject(createTime, forKey: "createTime")
		}
		if fadePartnerNum != nil{
			aCoder.encodeObject(fadePartnerNum, forKey: "fadePartnerNum")
		}
		if flag != nil{
			aCoder.encodeObject(flag, forKey: "flag")
		}
		if imucUid != nil{
			aCoder.encodeObject(imucUid, forKey: "imucUid")
		}
		if isBlackList != nil{
			aCoder.encodeObject(isBlackList, forKey: "isBlackList")
		}
		if location != nil{
			aCoder.encodeObject(location, forKey: "location")
		}
		if masterShopId != nil{
			aCoder.encodeObject(masterShopId, forKey: "masterShopId")
		}
		if name != nil{
			aCoder.encodeObject(name, forKey: "name")
		}
		if partnerNum != nil{
			aCoder.encodeObject(partnerNum, forKey: "partnerNum")
		}
		if personalDesc != nil{
			aCoder.encodeObject(personalDesc, forKey: "personalDesc")
		}
		if phoneNum != nil{
			aCoder.encodeObject(phoneNum, forKey: "phoneNum")
		}
		if pinyin != nil{
			aCoder.encodeObject(pinyin, forKey: "pinyin")
		}
		if pinyinGroup != nil{
			aCoder.encodeObject(pinyinGroup, forKey: "pinyinGroup")
		}
		if province != nil{
			aCoder.encodeObject(province, forKey: "province")
		}
		if realPartnerNum != nil{
			aCoder.encodeObject(realPartnerNum, forKey: "realPartnerNum")
		}
		if relationType != nil{
			aCoder.encodeObject(relationType, forKey: "relationType")
		}
		if remarkName != nil{
			aCoder.encodeObject(remarkName, forKey: "remarkName")
		}
		if remarkNamePinyin != nil{
			aCoder.encodeObject(remarkNamePinyin, forKey: "remarkNamePinyin")
		}
		if remarkNamePinyinGroup != nil{
			aCoder.encodeObject(remarkNamePinyinGroup, forKey: "remarkNamePinyinGroup")
		}
		if saleNum != nil{
			aCoder.encodeObject(saleNum, forKey: "saleNum")
		}
		if sex != nil{
			aCoder.encodeObject(sex, forKey: "sex")
		}
		if shopAuth != nil{
			aCoder.encodeObject(shopAuth, forKey: "shopAuth")
		}
		if shopContribution != nil{
			aCoder.encodeObject(shopContribution, forKey: "shopContribution")
		}
		if shopId != nil{
			aCoder.encodeObject(shopId, forKey: "shopId")
		}
		if shopIdT != nil{
			aCoder.encodeObject(shopIdT, forKey: "shopId_t")
		}
		if shopKey != nil{
			aCoder.encodeObject(shopKey, forKey: "shopKey")
		}
		if street != nil{
			aCoder.encodeObject(street, forKey: "street")
		}
		if title != nil{
			aCoder.encodeObject(title, forKey: "title")
		}
		if updateTime != nil{
			aCoder.encodeObject(updateTime, forKey: "updateTime")
		}
		if wid != nil{
			aCoder.encodeObject(wid, forKey: "wid")
		}

	}

}