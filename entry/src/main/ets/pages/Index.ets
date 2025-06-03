import { HomePage } from './Home';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @Provide('pageInfo') pageInfo: NavPathStack = new NavPathStack();

  build() {
    Column() {
      Navigation(this.pageInfo) {
        // Tabs({ barPosition: BarPosition.End }) {
        //   TabContent() {
        //     Text("首页").fontSize(38)
        //   }.tabBar("Home")
        //
        //   TabContent() {
        //     Text("设置").fontSize(38)
        //   }.tabBar("设置")
        // }
        // .height('100%')
        // .width('100%')
        List(){
          ListItem(){
            Text("Home page")
          }
        }
      }.mode(NavigationMode.Auto)
      .navDestination((name: string, params: Map<string, string>) => {
        console.log('Nav params', params);

        switch(name) {
          case 'Home':
            return HomePage();
            default:
              return HomePage();
        }
      })
      .menus([
        {
          value: "Home", action: () => {}
        },
        {
          value: "Home", action: () => {}
        }
      ]).toolbarConfiguration([
        {
          value: "Home", action: () => {
            console.log('Toolbar config 1 clicked')
          }
        },
        {
          value: "Settings",
          action: () => console.log("Tab settings clicked")
        }])
    }
  }
}