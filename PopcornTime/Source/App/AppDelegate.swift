import UIKit
import TVServices

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Attributes
    
    var window: UIWindow?

    
    // MARK: - Lifecycle

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = PlayerView()
        self.window?.makeKeyAndVisible()
        forceTopShelfUpdate()
        return true
    }
    
    
    // MARK: - Private
    
    private func forceTopShelfUpdate() {
        NSNotificationCenter().postNotificationName(TVTopShelfItemsDidChangeNotification, object: nil)
    }
}

