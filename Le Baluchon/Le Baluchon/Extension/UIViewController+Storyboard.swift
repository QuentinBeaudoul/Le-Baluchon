import UIKit

extension UIViewController {
    
    class func makeFromStoryboard(_ storyboardName: String? = nil) -> UIViewController {
        return UIStoryboard(name: storyboardName ?? String(describing: self).replacingOccurrences(of: "ViewController", with: ""), bundle: Bundle(identifier: "com.ikomobi.Brookies")).instantiateViewController(withIdentifier: String(describing: self))
    }
    
}
