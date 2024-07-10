
# AHYDS

# 關於此 App:
疫情生活下, 都市人及學生為防疫居家工作及上課, 並減少外出, 導致缺乏運動, 但是居家運動卻又苦於沒有指導, 令訓練動作不標準, 更有人令自己受傷, 但手機程式要糾正用家動作又有諸多難的, 如正確檢測用家姿勢並給予反饋.

居家期間, 利用AI輔助你一個人以正確姿勢運動

我們曾經看見一個籃球應用程式可以量度用家的投球準確率, 並且利用人工智能將投球的軌跡繪畫於螢幕上.
近期疫情當道, 大部份課堂的進度均受影響, 尤其體育堂最嚴重, 因無法於實體進行運動, 大部份課程均受阻, 相較其他科目而言 體育科老師利用拍攝形式進行功課評分以及課程講解, 對於體育科老師而言工作量大增, 而且運動途無人進行即時指導, 令學生即使有錯誤的動作也無法得知, 所以我們希望可以利用我們的應用程式改變現狀, 其次於討論期間, 我們發現我們應用程式的功能可以延展至大部份的居家運動.
一些居家運動例如體適能、tabata 及徒手訓練, 可以透過應用程式達到偵測姿勢, 從而進一步糾正的目的.

我們設想這個應用程式評估用戶他們的運動姿勢是否正確, 目前我們利用了 Apple 的 WWDC 2017 發佈的 CoreML, Vision會將辨認身體的19個點, 並進行反饋, 我們利用 Swift 連接了數個點, 表示為人體, 其後計算不同關節的角度.
首先為了迎合我們的主要目的, 我們會設有課程功能, 老師可以以發佈功課的形式發佈學生所需要的動作, 我們會預設部份常用的動作, 其餘動作老師可以通過人工智能預錄, 以達到發佈作業的目的.
其次, 我們 發現 大部份都市人沒有運動的習慣, 除這因素以外, 更多的人是因為沒有專業的人士指導或是帶領運動, 以致無法踏出運動的第一步, 所以我們希望幫助更多人踏出第一步, 我們希望可以幫助他們循序漸進地運動, 另外我們設有多巴胺獎勵計劃, 以勳章形式進行獎勵, 他們在運動這個領域獲得榮譽感.
最後, 我們會記錄訓練, 令用戶可以查閱自己曾經的運動記錄, 見證自己的成長.

# App 功能:
- 紀錄明天的運動量
- AI 協助你紀錄運動的卡路里消耗量(掌上壓, 仰臥起坐和跳繩)
- 在日曆上偏排做運動的日期
- 信息提醒用戶做運動

# App 未來會加入的功能:

1. 個性化訓練計劃：App可以分析用戶的表現數據，並根據個人需求、弱點和目標提供量身定制的個性化訓練計劃。
2. 實時反饋：為用戶提供有關他們在訓練或比賽中表現的即時反饋，包括速度、準確性、力量等指標。
3. 視頻分析：允許用戶上傳視頻片段，並使用AI算法分析的技術，找出需要改進的地方，並提供個性化的反饋。
4. 虛擬教練：將虛擬教練功能集成到App中，讓用戶可以從Al虛擬教練獲得指導和反饋。
5. 傷害預防：通過AI算法分析用戶表現數據，識別潛在傷害風險，為用戶提供有針對性的傷害預防建議。
6. 績效跟踪：為用戶提供詳細的績效跟踪和分析工具，使他們能夠隨著時間的推移監控自己的進度並確定需要改進的地方。
7. 社交分享：允許用戶與朋友和其他用戶分享他們的表現數據和成就，並圍繞App創建一個社交網絡。
8. 遊戲化：使用遊戲化技術讓您的應用更具吸引力和激勵性，包括排行榜、挑戰和獎勵等功能。
9. 高級分析：使用機器學習等高級分析技術來分析用戶性能數據的大型數據集，並提供對趨勢和模式的洞察。
10. 營養追踪：追踪用戶的食物攝入量，並根據他們的個人目標和活動水平接收個性化的營養建議。
11. 虛擬比賽：創建允許用戶相互競爭的虛擬比賽，即使他們不在同一地點。
12. 可穿戴集成：與智能手錶和健身追踪器等可穿戴設備集成，以收集有關用戶表現的更準確和詳細的數據。
13. 擴增實境：利用擴增實境（AR）技術打造身臨其境的訓練體驗，讓用戶在逼真的虛擬環境中進行練習。
14. 語音命令：將語音命令整合到App中，讓用戶在訓練時免提控制應用程序。
15. 社區支持：建立一個網上社區，讓用戶與志同道合的人聯繫並分享技巧、建議和鼓勵。
16. 心智訓練：提供心智訓練練習和技巧，幫助用戶提高注意力、專注力和心理韌性。
17. 個性化內容：根據用戶的興趣、目標和過去在應用內的活動，為用戶提供個性化內容推薦。
18. 語言支持：通過提供對多種語言的支援，使App可供世界各地的用戶使用。
19. 安全功能：結合緊急聯繫信息、GPS 跟踪和警報等安全功能，以幫助確保用戶在訓練時的安全。
20. 輔助功能：通過合併文本到語音和高對比度模式和屏幕閱讀器支援等功能，讓殘障用戶可以使用。

# 開發:
```shell
git clone http://github.com/TsangHingTat/AHYDS.git
```
- Xcode 13
- iOS 16 SDK
- iOS 16.0
- macOS 13.0


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
| 1 |  活動 1 (仰臥起坐)  |
| 2 |  活動 2 (掌上壓) |
| 3 |  活動 3  |
| 4 |  活動 4  |
| 5 |  活動 1 (仰臥起坐) 卡路里消耗量  |
| 6 |  活動 2 (掌上壓) 卡路里消耗量  |
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
## 用戶訊息:
### 即時：
```swift
notification(title: String, subtitle: String) -> Void
```

### 範例：
```swift
import Foundation
getdata().notification(title: "title", subtitle: "hi")
```


___
># App 預覽 (2.0.3)
>>## iPhone 15
>>><img src="https://raw.githubusercontent.com/TsangHingTat/ahyds/main/img/img3.png" width="200">
>>><img src="https://raw.githubusercontent.com/TsangHingTat/ahyds/main/img/img1.png" width="200">
>>><img src="https://raw.githubusercontent.com/TsangHingTat/ahyds/main/img/img4.png" width="200">
>>><img src="https://raw.githubusercontent.com/TsangHingTat/ahyds/main/img/img5.png" width="200">
>>><img src="https://raw.githubusercontent.com/TsangHingTat/ahyds/main/img/img2.png" width="200">
>>><img src="https://raw.githubusercontent.com/TsangHingTat/ahyds/main/img/img6.png" width="200">
>>## M1 iPad Pro 12.9 inch
>>><img src="https://raw.githubusercontent.com/TsangHingTat/ahyds/main/img/imgpad6.png" width="1000">
>>><img src="https://raw.githubusercontent.com/TsangHingTat/ahyds/main/img/imgpad5.png" width="1000">
>>><img src="https://raw.githubusercontent.com/TsangHingTat/ahyds/main/img/imgpad4.png" width="1000">
>>><img src="https://raw.githubusercontent.com/TsangHingTat/ahyds/main/img/imgpad1.png" width="1000">
>>><img src="https://raw.githubusercontent.com/TsangHingTat/ahyds/main/img/imgpad2.png" width="1000">
>>><img src="https://raw.githubusercontent.com/TsangHingTat/ahyds/main/img/imgpad3.png" width="1000">




# 支援的裝置:
## iPhone
- iPhone 14
- iPhone 14 Plus
- iPhone 14 Pro
- iPhone 14 Pro Max
- iPhone 13
- iPhone 13 mini
- iPhone 13 Pro
- iPhone 13 Pro Max
- iPhone 12
- iPhone 12 mini
- iPhone 12 Pro
- iPhone 12 Pro Max
- iPhone 11
- iPhone 11 Pro
- iPhone 11 Pro Max
- iPhone XS
- iPhone XS Max
- iPhone XR
- iPhone X
- iPhone 8
- iPhone 8 Plus
- iPhone SE (3rd generation)
- iPhone SE (2nd generation)

## iPad
- iPad mini (6th generation)
- iPad (6th generation and newer)
- iPad Air (4th generation and newer)
- iPad Pro 11-inch (1st, 2nd, 3rd, 4th, and 5th generations)
- iPad Pro 12.9-inch (2nd, 3rd, 4th, and 5th generations)
- Pad Pro 10.5-inch

# 許可證:

<a href="https://github.com/TsangHingTat/ahyds/blob/main/LICENSE.md">Apache License</a>



Copyright © 2023, TsangHingTat

