import { HomePage } from './Home';
import { SettingsPage } from './Settings';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @Provide('pageInfo') pageInfo: NavPathStack = new NavPathStack();

  build() {
    Column() {
      Navigation(this.pageInfo) {
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            HomePage();
          }.tabBar("Home")

          TabContent() {
            SettingsPage();
          }.tabBar("设置")
        }
        .height('100%')
        .width('100%')
      }.mode(NavigationMode.Auto)
      .navDestination((name: string, params: Map<string, string>) => {
        console.log('Nav params', params);

        switch(name) {
          case '首页':
            return HomePage();
            default:
              return HomePage();
        }
      })
      .menus([
        {
          value: "Search", action: () => {}
        },
        {
          value: "Add", action: () => {}
        }
      ])
      .toolbarConfiguration([
        {
          value: "Home", action: () => {
            console.log('Toolbar config 1 clicked')
          }
        },
        {
          value: "Settings",
          action: () => console.log("Tab settings clicked")
        }])
      .hideToolBar(true)
    }
  }
}