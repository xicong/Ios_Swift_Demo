import UIKit

class SlidingViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - 控制器的信息
    func setUpTabBar() {
        
        let demo1VC  = SlidingTabBarSubPage()
        let demo2VC  = TabBarSubPage2()
        let demo3VC  = TabBarSubPage3()
        let demo4VC  = TabBarSubPage4()
        let demo5VC  = TabBarSubPage5()
        
        self.creatTabbarView(viewController:demo1VC, image: "home_unselected", selectImage: "home_selected", title: "首页",tag: 1)
        self.creatTabbarView(viewController:demo2VC, image: "find_unselected", selectImage: "find_selected", title: "发现",tag: 2)
        self.creatTabbarView(viewController:demo3VC, image: "add_unselected", selectImage: "add_selected", title: "添加",tag: 3)
        self.creatTabbarView(viewController:demo4VC, image: "friend_unselected", selectImage: "friend_selected", title: "朋友",tag: 4)
        self.creatTabbarView(viewController:demo5VC, image: "mine_unselected", selectImage: "mine_selected", title: "我的",tag: 5)
        
        self.tabBar.tintColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 13/255.0, alpha: 1)
        self.tabBar.isTranslucent = false
        
        self.viewControllers = [
            UINavigationController(rootViewController: demo1VC),
            UINavigationController(rootViewController: demo2VC),
            UINavigationController(rootViewController: demo3VC),
            UINavigationController(rootViewController: demo4VC),
            UINavigationController(rootViewController: demo5VC),
        ];
        
    }
    
    // MARK: - TabBar里面的文字图片
    func creatTabbarView(viewController:UIViewController, image:NSString, selectImage:NSString, title:NSString, tag:NSInteger) {
        // alwaysOriginal 始终绘制图片原始状态，不使用Tint Color。
        viewController.tabBarItem.image = UIImage(named: image as String)?.withRenderingMode(.alwaysOriginal)
        viewController.tabBarItem.selectedImage = UIImage(named: selectImage as String)?.withRenderingMode(.alwaysOriginal)
        viewController.title = title as String
        viewController.tabBarItem.tag = tag
        
    }
    

}
