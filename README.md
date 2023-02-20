
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
3. 視頻分析：允許用戶上傳自己的表演視頻片段，並使用AI算法分析的技術，找出需要改進的地方，並提供個性化的反饋。
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
># App 預覽 (1.3.67)
>>## iPhone 14 Pro
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
- iPhone Pro Max (11 and newer)
- iPhone Pro (11 and newer)
- iPhone (11 and newer)
- iPhone mini (12 and newer)
- iPhone SE (2nd generation and newer)
- iPhone X & XR
- iPhone XS & XS Max
- iPhone 8 & 8 Plus

## iPad
- iPad mini (6th generation)
- iPad (10th generation)
- iPad (9th generation)
- iPad Air (4th generation)
- iPad Air (5th generation)
- iPad Pro 11-inch (1st, 2nd, 3rd, 4th, and 5th generations)
- iPad Pro 12.9-inch (2nd, 3rd, 4th, and 5th generations)
- iPad Pro 10.5-inch
- iPad (8th generation)

## Mac
- iMac (2017 and later)
- iMac Pro (2017 and later)
- MacBook (2017 and later)
- MacBook Air (2018 and later)
- MacBook Pro (2017 and later)
- Mac Mini (2018 and later)
- Mac Pro (2019 and later)
- Mac Studio (2022)

# 許可證:
                                Apache License
                           Version 2.0, January 2004
                        http://www.apache.org/licenses/

   TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION

   1. Definitions.

      "License" shall mean the terms and conditions for use, reproduction,
      and distribution as defined by Sections 1 through 9 of this document.

      "Licensor" shall mean the copyright owner or entity authorized by
      the copyright owner that is granting the License.

      "Legal Entity" shall mean the union of the acting entity and all
      other entities that control, are controlled by, or are under common
      control with that entity. For the purposes of this definition,
      "control" means (i) the power, direct or indirect, to cause the
      direction or management of such entity, whether by contract or
      otherwise, or (ii) ownership of fifty percent (50%) or more of the
      outstanding shares, or (iii) beneficial ownership of such entity.

      "You" (or "Your") shall mean an individual or Legal Entity
      exercising permissions granted by this License.

      "Source" form shall mean the preferred form for making modifications,
      including but not limited to software source code, documentation
      source, and configuration files.

      "Object" form shall mean any form resulting from mechanical
      transformation or translation of a Source form, including but
      not limited to compiled object code, generated documentation,
      and conversions to other media types.

      "Work" shall mean the work of authorship, whether in Source or
      Object form, made available under the License, as indicated by a
      copyright notice that is included in or attached to the work
      (an example is provided in the Appendix below).

      "Derivative Works" shall mean any work, whether in Source or Object
      form, that is based on (or derived from) the Work and for which the
      editorial revisions, annotations, elaborations, or other modifications
      represent, as a whole, an original work of authorship. For the purposes
      of this License, Derivative Works shall not include works that remain
      separable from, or merely link (or bind by name) to the interfaces of,
      the Work and Derivative Works thereof.

      "Contribution" shall mean any work of authorship, including
      the original version of the Work and any modifications or additions
      to that Work or Derivative Works thereof, that is intentionally
      submitted to Licensor for inclusion in the Work by the copyright owner
      or by an individual or Legal Entity authorized to submit on behalf of
      the copyright owner. For the purposes of this definition, "submitted"
      means any form of electronic, verbal, or written communication sent
      to the Licensor or its representatives, including but not limited to
      communication on electronic mailing lists, source code control systems,
      and issue tracking systems that are managed by, or on behalf of, the
      Licensor for the purpose of discussing and improving the Work, but
      excluding communication that is conspicuously marked or otherwise
      designated in writing by the copyright owner as "Not a Contribution."

      "Contributor" shall mean Licensor and any individual or Legal Entity
      on behalf of whom a Contribution has been received by Licensor and
      subsequently incorporated within the Work.

   2. Grant of Copyright License. Subject to the terms and conditions of
      this License, each Contributor hereby grants to You a perpetual,
      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
      copyright license to reproduce, prepare Derivative Works of,
      publicly display, publicly perform, sublicense, and distribute the
      Work and such Derivative Works in Source or Object form.

   3. Grant of Patent License. Subject to the terms and conditions of
      this License, each Contributor hereby grants to You a perpetual,
      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
      (except as stated in this section) patent license to make, have made,
      use, offer to sell, sell, import, and otherwise transfer the Work,
      where such license applies only to those patent claims licensable
      by such Contributor that are necessarily infringed by their
      Contribution(s) alone or by combination of their Contribution(s)
      with the Work to which such Contribution(s) was submitted. If You
      institute patent litigation against any entity (including a
      cross-claim or counterclaim in a lawsuit) alleging that the Work
      or a Contribution incorporated within the Work constitutes direct
      or contributory patent infringement, then any patent licenses
      granted to You under this License for that Work shall terminate
      as of the date such litigation is filed.

   4. Redistribution. You may reproduce and distribute copies of the
      Work or Derivative Works thereof in any medium, with or without
      modifications, and in Source or Object form, provided that You
      meet the following conditions:

      (a) You must give any other recipients of the Work or
          Derivative Works a copy of this License; and

      (b) You must cause any modified files to carry prominent notices
          stating that You changed the files; and

      (c) You must retain, in the Source form of any Derivative Works
          that You distribute, all copyright, patent, trademark, and
          attribution notices from the Source form of the Work,
          excluding those notices that do not pertain to any part of
          the Derivative Works; and

      (d) If the Work includes a "NOTICE" text file as part of its
          distribution, then any Derivative Works that You distribute must
          include a readable copy of the attribution notices contained
          within such NOTICE file, excluding those notices that do not
          pertain to any part of the Derivative Works, in at least one
          of the following places: within a NOTICE text file distributed
          as part of the Derivative Works; within the Source form or
          documentation, if provided along with the Derivative Works; or,
          within a display generated by the Derivative Works, if and
          wherever such third-party notices normally appear. The contents
          of the NOTICE file are for informational purposes only and
          do not modify the License. You may add Your own attribution
          notices within Derivative Works that You distribute, alongside
          or as an addendum to the NOTICE text from the Work, provided
          that such additional attribution notices cannot be construed
          as modifying the License.

      You may add Your own copyright statement to Your modifications and
      may provide additional or different license terms and conditions
      for use, reproduction, or distribution of Your modifications, or
      for any such Derivative Works as a whole, provided Your use,
      reproduction, and distribution of the Work otherwise complies with
      the conditions stated in this License.

   5. Submission of Contributions. Unless You explicitly state otherwise,
      any Contribution intentionally submitted for inclusion in the Work
      by You to the Licensor shall be under the terms and conditions of
      this License, without any additional terms or conditions.
      Notwithstanding the above, nothing herein shall supersede or modify
      the terms of any separate license agreement you may have executed
      with Licensor regarding such Contributions.

   6. Trademarks. This License does not grant permission to use the trade
      names, trademarks, service marks, or product names of the Licensor,
      except as required for reasonable and customary use in describing the
      origin of the Work and reproducing the content of the NOTICE file.

   7. Disclaimer of Warranty. Unless required by applicable law or
      agreed to in writing, Licensor provides the Work (and each
      Contributor provides its Contributions) on an "AS IS" BASIS,
      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
      implied, including, without limitation, any warranties or conditions
      of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
      PARTICULAR PURPOSE. You are solely responsible for determining the
      appropriateness of using or redistributing the Work and assume any
      risks associated with Your exercise of permissions under this License.

   8. Limitation of Liability. In no event and under no legal theory,
      whether in tort (including negligence), contract, or otherwise,
      unless required by applicable law (such as deliberate and grossly
      negligent acts) or agreed to in writing, shall any Contributor be
      liable to You for damages, including any direct, indirect, special,
      incidental, or consequential damages of any character arising as a
      result of this License or out of the use or inability to use the
      Work (including but not limited to damages for loss of goodwill,
      work stoppage, computer failure or malfunction, or any and all
      other commercial damages or losses), even if such Contributor
      has been advised of the possibility of such damages.

   9. Accepting Warranty or Additional Liability. While redistributing
      the Work or Derivative Works thereof, You may choose to offer,
      and charge a fee for, acceptance of support, warranty, indemnity,
      or other liability obligations and/or rights consistent with this
      License. However, in accepting such obligations, You may act only
      on Your own behalf and on Your sole responsibility, not on behalf
      of any other Contributor, and only if You agree to indemnify,
      defend, and hold each Contributor harmless for any liability
      incurred by, or claims asserted against, such Contributor by reason
      of your accepting any such warranty or additional liability.

   END OF TERMS AND CONDITIONS

   APPENDIX: How to apply the Apache License to your work.

      To apply the Apache License to your work, attach the following
      boilerplate notice, with the fields enclosed by brackets "[]"
      replaced with your own identifying information. (Don't include
      the brackets!)  The text should be enclosed in the appropriate
      comment syntax for the file format. We also recommend that a
      file or class name and description of purpose be included on the
      same "printed page" as the copyright notice for easier
      identification within third-party archives.

   Copyright 2023 TsanHingTat

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

Copyright (c) 2021 - 2022, M2-Ultra
Copyright (c) 2021 - 2023, TsangHingTat

