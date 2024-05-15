import { dataItem } from 'ets/componets/dataList/dataItem'
import router from '@ohos.router'

@Entry
@Component
struct AboutUsPage {
  @State isShowQQ: boolean = false
  @State version: string = "V4.1.13"
  @State first_list: dataItem[] = [
    new dataItem("检查更新", 1),
    new dataItem("更新日志", 2),
    new dataItem("开发人员", 3),
  ];

  @State middle_list: dataItem[] = [
    new dataItem("QQ群", 1),
    new dataItem("邮件", 2),
    new dataItem("Discord", 3),
    new dataItem("电报", 4),
  ]

  @State end_list: dataItem[] = [
    new dataItem("用户隐私与协议", 1),
    new dataItem("开源许可", 2),
    new dataItem("免责声明", 3),
    new dataItem("崩溃日志", 4),
  ]

  firstUrl_list(value: number | string) {
    switch (value) {
      case 0:
      //todo 升级弹窗
        break
      case 1:
      //更新日志
        router.pushUrl({
          url: "pages/view/myCenter/aboutUs/versionLogPage"
        })
        break
      case 2:
      //todo 开发人员
        break
    }
  }

  middleUrl_list(value: number | string) {
    switch (value) {
      case 0:
        //QQ群
        this.isShowQQ = true
        break
      case 1:
        //todo 邮件
        break
      case 2:
        //todo Discord
        break
      case 3:
        //todo 电报
        break
    }
  }

  endUrl_list(value: number | string) {
    switch (value) {
      case 0:
        //用户隐私与协议
        router.pushUrl({
          url: "pages/view/myCenter/aboutUs/PrivacyAgreementPage"
        })
        break
      case 1:
        //开源许可
        router.pushUrl({
          url: "pages/view/myCenter/aboutUs/OpenSourceLicense"
        })
        break
      case 2:
        //免责声明 Disclaimer
        break
      case 3:
        //todo 崩溃日志
        break
    }
  }

  build() {
    Scroll() {
      Column({ space: 16 }) {
        Row() {
          Image($r("app.media.return_left"))
            .position({ x: 0 })
            .size({ width: 24, height: 24 })
            .interpolation(ImageInterpolation.Medium)
            .onClick(() => {
              router.back()
            })
          Blank(20)
          Text("关于我们")
            .lineHeight(24)
            .font({
              size: 16,
              weight: 500,
              style: FontStyle.Normal,
              // family: "PingFang SC"
            })
          Blank(20)
        }
        .padding({
          top: 12,
          bottom: 12,
        })
        .height(48)
        .width("100%")

        this.middleClick(this.first_list, "app.media.right", this.version, "first")

        Row({ space: 16 }) {
          this.middleBox("app.media.official_website", "官网")
          this.middleBox("app.media.wechat_public_account", "微信公众号")
          this.middleBox("app.media.channel", "QQ频道")
        }
        // QQ群的半模态框 不知道绑定在哪里，鸿蒙官方怎么想的，非要绑定一个元素？
        .bindSheet($$this.isShowQQ, this.QQDialog(), {
          height: 300,
          showClose: false,
          dragBar: false,
          blurStyle: BlurStyle.COMPONENT_ULTRA_THIN,
          onDisappear: () => {
            // this.clickBookType = ''
          }
        })

        this.middleClick(this.middle_list, "app.media.right", null, "middle")
        this.middleClick(this.end_list, "app.media.right", null, "end")
      }
      .padding(20)
      .backgroundColor("rgb(245, 245, 245)")
    }
  }

  @Builder
  middleBox(image: string, text: string) {
    Column({ space: 2 }) {
      Image($r(`${image}`)).size({ width: 24, height: 24 })
      Text(text)
        .lineHeight(20)
        .font({
          // family: "PingFang SC",
          size: 12,
          weight: 400,
          style: FontStyle.Normal,
        })
        .opacity(0.45)
    }
    .padding(12)
    .width(96)
    .height(70)
    .borderRadius(12)
    .backgroundColor(Color.White)
    .onClick(() => {

    })
  }

  @Builder
  middleClick(list: Array<dataItem>, image: string, version: string | null, urlList: string) {
    Column() {
      ForEach(list, (item: dataItem, index) => {
        Row() {
          Text(item.title)
            .lineHeight(22)
            .font({
              // family: "PingFang SC",
              size: 16,
              weight: 400,
              style: FontStyle.Normal,
            })
          Blank(20)
          if (version && index === 0) {
            Text(version)
              .lineHeight(20)
              .font({
                // family: "PingFang SC",
                size: 12,
                weight: 400,
                style: FontStyle.Normal,
              })
              .baselineOffset(4)
              .opacity(0.45)
              .margin({
                right: 4
              })
          }
          Image($r(`${image}`)).size({ width: 24, height: 24 })
        }
        .width("100%")
        .height(48)
        .onClick(() => {
          switch (urlList) {
            case 'first':
              this.firstUrl_list(index)
              break
            case 'middle':
              this.middleUrl_list(index)
              break
            case 'end':
              this.endUrl_list(index)
              break
          }
        })
      })
    }

    .padding({
      top: 12,
      bottom: 12,
      left: 20,
      right: 20
    })
    .backgroundColor(Color.White)
    .borderRadius(10)
  }

  @State qqList: Array<string> = [
    'QQ群1:2031546254',
    'QQ群2:2031546254',
    'QQ群3:2031546254',
    'QQ群4:2031546254',
    'QQ群5:2031546254',
  ]

  @Builder
  QQDialog() {
    Column() {
      Column() {
        Row() {
          Text("QQ群")
            .lineHeight(24)
            .font({
              family: "PingFang SC",
              size: 16,
              style: FontStyle.Normal,
              weight: 500,
            })
        }
        .justifyContent(FlexAlign.Center)
        .height(48)
        .width("100%")

        Scroll() {
          Column() {
            ForEach(this.qqList, (item: string) => {
              Row() {
                Text(item)
                  .lineHeight(22)
                  .fontColor("#000000")
                  .font({
                    family: "PingFang SC",
                    size: 14,
                    style: FontStyle.Normal,
                    weight: 400,
                  })
                Blank(20)
                Image($r('app.media.right'))
                  .width(24)
                  .height(24)
                  .margin({
                    right: 5
                  })
              }
              .margin({
                top: 12,
                bottom: 12
              })
              .width('100%')
            })
          }
        }
        .height('60%')
        .scrollBar(BarState.Off)
      }
      .padding({
        left: 20,
        right: 20
      })


      Divider()

      Column() {
        Text('取消').fontSize(16).fontWeight(400)
          .lineHeight(24)
      }
      .onClick(() => {
        this.isShowQQ = false
      })
      .alignItems(HorizontalAlign.Center)
      .padding({
        left: 32,
        right: 32,
        top: 16
      })
    }

    // .width(CommonConstants.FULL_WIDTH)
    // .height(CommonConstants.FULL_HEIGHT)
  }
}