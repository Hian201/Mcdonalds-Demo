//
//  MealModel.swift
//  Mcdonalds Demo
//
//  Created by yixuan on 2022/11/21.
//

import Foundation

//airtable之中每一筆資料是一個record
struct MealData: Codable {
    let records: [Record]
}

//airtable新增資料會自動產生id，每個欄位資料會存在field
struct Record: Codable {
    let id, createdTime: String
    let fields: MenuItem
}

struct MenuItem: Codable {
    let name: String?
    let image: [Image]?
    let kcal: String?
    let category: String?
    let mealDescription: String?
    var combo: String?
}

struct Image: Codable {
    let url: URL
}









/*
let meals = [
    MenuSection(name: "早餐", items: [
        MenuItem(name: "滿福堡", category: "早餐", combo: "", kcal: 290, mealDescription: "早餐推薦你最經典的英式滿福!特選洗選蛋搭配櫸木煙燻火腿片，最後放上一片熱呼呼融化的切達吉事，這樣開啟一天真好!吃滿福，保好運，活力滿格，好運也滿格喔！"),
        MenuItem(name: "豬肉滿福堡", category: "早餐", combo: "", kcal: 316, mealDescription: "早餐推薦！美國小麥製的滿福麵包，比你的彈簧床還Q彈！搭配香煎豬肉片與切達吉事，簡單美味。吃滿福，保好運，吃豬肉滿福堡，堡豬事福氣滿出來！"),
        MenuItem(name: "豬肉滿福堡加蛋", category: "早餐", combo: "", kcal: 389, mealDescription: "香嫩柔軟的太陽蛋，絕配香煎豬肉片，還有熱騰騰融化的切達吉事，最後蓋上軟中帶勁的滿福麵包！吃滿福保好運、上班上學一切順利！")]),
    
    MenuSection(name: "超值全餐", items: [
        MenuItem(name: "大麥克", category: "超值全餐", combo: "", kcal: 548, mealDescription: "麥當勞永遠的一號餐，全球狂熱50年，紐澳100%雙層純牛肉，淋上大麥克招牌醬料，加上生菜、吉事、洋蔥、酸黃瓜， 美味層層堆疊，口感樂趣無窮。 從美國總統到素人都是鐵粉，經濟學家還發明「大麥克指數」致敬，果然，只有大麥克，才是大麥克！"),
        MenuItem(name: "雙層牛肉吉事堡", category: "超值全餐", combo: "", kcal: 467, mealDescription: "紐澳雙層100%優質牛肉， 搭配雙層切達吉事片， 酸黃瓜、洋蔥在裡面， 芥末醬、番茄醬淋上去， 層出不窮的經典滋味， 真的沒在跟你客氣的。")])
]
*/

/*
let meals2 = [
    [MenuItem(name: "滿福堡", category: "早餐", combo: "", kcal: "290", mealDescription: "早餐推薦你最經典的英式滿福!特選洗選蛋搭配櫸木煙燻火腿片，最後放上一片熱呼呼融化的切達吉事，這樣開啟一天真好!吃滿福，保好運，活力滿格，好運也滿格喔！"),
     MenuItem(name: "豬肉滿福堡", category: "早餐", combo: "", kcal: "316", mealDescription: "早餐推薦！美國小麥製的滿福麵包，比你的彈簧床還Q彈！搭配香煎豬肉片與切達吉事，簡單美味。吃滿福，保好運，吃豬肉滿福堡，堡豬事福氣滿出來！"),
     MenuItem(name: "豬肉滿福堡加蛋", category: "早餐", combo: "", kcal: "389", mealDescription: "香嫩柔軟的太陽蛋，絕配香煎豬肉片，還有熱騰騰融化的切達吉事，最後蓋上軟中帶勁的滿福麵包！吃滿福保好運、上班上學一切順利！")],
    
    [MenuItem(name: "大麥克", category: "超值全餐", combo: "", kcal: "548", mealDescription: "麥當勞永遠的一號餐，全球狂熱50年，紐澳100%雙層純牛肉，淋上大麥克招牌醬料，加上生菜、吉事、洋蔥、酸黃瓜， 美味層層堆疊，口感樂趣無窮。 從美國總統到素人都是鐵粉，經濟學家還發明「大麥克指數」致敬，果然，只有大麥克，才是大麥克！"),
    MenuItem(name: "雙層牛肉吉事堡", category: "超值全餐", combo: "", kcal: "467", mealDescription: "紐澳雙層100%優質牛肉， 搭配雙層切達吉事片， 酸黃瓜、洋蔥在裡面， 芥末醬、番茄醬淋上去， 層出不窮的經典滋味， 真的沒在跟你客氣的。")]
]
*/

