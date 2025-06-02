@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Tabs({barPosition: BarPosition.End}) {
      TabContent() {
        Text("首页").fontSize(38)
      }.tabBar("Home")
      TabContent() {
        Text("设置").fontSize(38)
      }.tabBar("设置")
    }
    .height('100%')
    .width('100%')
  }
}