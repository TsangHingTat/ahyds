# AHYDS
把 github 的 git 轉移到自家的 git 服務。

# 關於此 App：
疫情生活下，都市人及學生為防疫居家工作及上課，並減少外出，導致缺乏運動，但是居家運動卻又苦於沒有指導，令訓練動作不標準，更有人令自己受傷，但手機程式要糾正用家動作又有諸多難的，如正確檢測用家姿勢並給予反饋。

居家期間，利用AI輔助你一個人以正確姿勢運動

我們曾經看見一個籃球應用程式可以量度用家的投球準確率，並且利用人工智能將投球的軌跡繪畫於螢幕上。
近期疫情當道, 大部份課堂的進度均受影響，尤其體育堂最嚴重，因無法於實體進行運動，大部份課程均受阻，相較其他科目而言 體育科老師利用拍攝形式進行功課評分以及課程講解，對於體育科老師而言工作量大增，而且運動途無人進行即時指導，令學生即使有錯誤的動作也無法得知，所以我們希望可以利用我們的應用程式改變現狀，其次於討論期間，我們發現我們應用程式的功能可以延展至大部份的居家運動。
一些居家運動例如體適能、tabata 及徒手訓練， 可以透過應用程式達到偵測姿勢， 從而進一步糾正的目的。

我們設想這個應用程式評估用戶他們的運動姿勢是否正確，目前我們利用了 Apple 的 WWDC 2017 發佈的 CoreML，Vision會將辨認身體的19個點，並進行反饋，我們利用 Swift 連接了數個點，表示為人體，其後計算不同關節的角度。
首先為了迎合我們的主要目的，我們會設有課程功能， 老師可以以發佈功課的形式發佈學生所需要的動作， 我們會預設部份常用的動作，其餘動作老師可以通過人工智能預錄， 以達到發佈作業的目的。
其次，我們 發現 大部份都市人沒有運動的習慣，除這因素以外，更多的人是因為沒有專業的人士指導或是帶領運動，以致無法踏出運動的第一步，所以我們希望幫助更多人踏出第一步，我們希望可以幫助他們循序漸進地運動，另外我們設有多巴胺獎勵計劃，以勳章形式進行獎勵，他們在運動這個領域獲得榮譽感。
最後，我們會記錄訓練， 令用戶可以查閱自己曾經的運動記錄，見證自己的成長。

# App 功能:
- 紀錄明天的運動量
- AI 協助你紀錄運動的卡路里消耗量(掌上壓, 仰臥起坐和跳繩)
- 在日曆上偏排做運動的日期
- 信息提醒用戶做運動

# 開發:
```shell
git clone http://58.177.101.104:9000/TsangHingTat/AHYDS.git
```
- Xcode 13
- iOS 15 SDK
- iOS 15.0
- macOS 13.0

# 需要新增的功能:
- Apple Watch 加速器
- Airpods Pro 陀螺儀
- 勳章
- 體適能
- tabata
- 課程
- 預錄
- 發布作業
- 在代碼中加入註解

# 數據閱讀及編輯-API
## String:
### 取得 String 類型的數據：
```swift
getdefaultsdata(type: String) -> String
```
### 保存 String 類型的數據：
```swift
savedefaultsdata(type: String, data: String) -> Void
```
### 範例：
```swift
import Foundation
getdata().savedefaultsdata(type: "ABC", data: "Hello world!")
print(getdata().getdefaultsdata(type: "ABC"))
```
```shell
>>> Hello world!
```
___

## Bool:
### 取得 Bool 類型的數據：
```swift
getdefaultsdatabool(type: String) -> Bool
```
### 保存 Bool 類型的數據：
```swift
savedefaultsdatabool(type: String, data: Bool) -> Void
```
### 範例：
```swift
import Foundation
getdata().savedefaultsdataint(type: "ABC", data: true)
print(getdata().getdefaultsdatabool(type: "ABC"))
```
```shell
>>> True
```
___

## Int:
### 取得 Int 類型的數據：
```swift
getdefaultsdatabool(type: String) -> Bool
```
### 保存 Int 類型的數據：
```swift
savedefaultsdatabool(type: String, data: Bool) -> Void
```
### 範例：
```swift
import Foundation
getdata().savedefaultsdataint(type: "ABC", data: 100)
print(getdata().getdefaultsdataint(type: "ABC"))
```
```shell
>>> 100
```
___

## 日曆:
### 保存日曆的數據：
```swift
savedata(date: String, datanum: Int, text: String) -> Void
```
### 取得日曆的數據：
```swift
getdata(date: String, datanum: Int) -> String
```
date 格式必須為 __String__: “yyyy-MM-dd”, datanum 格式必須為 __Int__
| datanum |  Output |
|---|---|
| 1 |  活動 1  |  
| 2 |  活動 2  |   
| 3 |  活動 3  |
| 4 |  活動 4  |
| 5 |  活動 1 卡路里消耗量  |
| 6 |  活動 2 卡路里消耗量  |
| 7 |  活動 3 卡路里消耗量  |
| 8 |  活動 4 卡路里消耗量  |

### 範例：
```swift
import Foundation
getdata().savedata(date: "2022-08-28", datanum: 1, text: "跳高")
print(getdata().getdata(date: "2022-08-28", datanum: 1))
```
```shell
>>> 跳高
```


___
># App 預覽 (1.3.67)
>>## iPhone 14 Pro
>>><img src="http://58.177.101.104:9000/TsangHingTat/ahyds/raw/branch/main/img/img3.png" width="200">
>>><img src="http://58.177.101.104:9000/TsangHingTat/ahyds/raw/branch/main/img/img1.png" width="200">
>>><img src="http://58.177.101.104:9000/TsangHingTat/ahyds/raw/branch/main/img/img4.png" width="200">
>>><img src="http://58.177.101.104:9000/TsangHingTat/ahyds/raw/branch/main/img/img5.png" width="200">
>>><img src="http://58.177.101.104:9000/TsangHingTat/ahyds/raw/branch/main/img/img2.png" width="200">
>>><img src="http://58.177.101.104:9000/TsangHingTat/ahyds/raw/branch/main/img/img6.png" width="200">
>>## M1 iPad Pro 12.9 inch 
>>><img src="http://58.177.101.104:9000/TsangHingTat/ahyds/raw/branch/main/img/imgpad6.png" width="1000">
>>><img src="http://58.177.101.104:9000/TsangHingTat/ahyds/raw/branch/main/img/imgpad5.png" width="1000">
>>><img src="http://58.177.101.104:9000/TsangHingTat/ahyds/raw/branch/main/img/imgpad4.png" width="1000">
>>><img src="http://58.177.101.104:9000/TsangHingTat/ahyds/raw/branch/main/img/imgpad1.png" width="1000">
>>><img src="http://58.177.101.104:9000/TsangHingTat/ahyds/raw/branch/main/img/imgpad2.png" width="1000">
>>><img src="http://58.177.101.104:9000/TsangHingTat/ahyds/raw/branch/main/img/imgpad3.png" width="1000">


# 支援的裝置:
## iPhone
- iPhone 14 Pro Max
- iPhone 14 Pro
- iPhone 14 Plus
- iPhone 14 
- iPhone 13 Pro Max
- iPhone 13 Pro
- iPhone 13 
- iPhone 13 mini 
- iPhone 12 Pro Max
- iPhone 12 Pro
- iPhone 12 
- iPhone 12 mini 
- iPhone 11 Pro Max 
- iPhone 11 Pro
- iPhone 11
- iPhone XS Max
- iPhone XS
- iPhone XR
- iPhone X
- iPhone 8 Plus
- iPhone 8
- iPhone 7 Plus
- iPhone 7
- iPhone SE (3nd Generation)
- iPhone SE (2nd Generation)
- iPhone SE
- iPhone 6s Plus
- iPhone 6s
- iPod touch (7th generation)

## iPad
- iPad Pro 6th generation
- iPad Pro 5th generation
- iPad Pro 4th generation
- iPad Pro 3rd generation
- iPad Pro 2nd generation
- iPad Pro 1st generation
- iPad 10th generation
- iPad 9th generation
- iPad 8th generation
- iPad 7th generation
- iPad 6th generation
- iPad 5th generation
- iPad mini 6th generation
- iPad mini 5th generation
- iPad mini 4
- iPad Air 5th generation
- iPad Air 4th generation
- iPad Air 3rd generation
- iPad Air 2

## Mac
- MacBook Air ( 2020 )
- MacBook Pro ( 13 吋 2020 )
- Mac mini ( 2020 )
- iMac ( 24 吋 2021 )
- MacBook Pro（14寸 2021）
- MacBook Pro（16寸 2021）
- Mac Studio（ 2022 ）
- MacBook Air ( 2022 )
- MacBook Pro ( 13 吋 2022 )

# 許可證:
MIT

Copyright (c) 2021 - 2022, M2-Ultra