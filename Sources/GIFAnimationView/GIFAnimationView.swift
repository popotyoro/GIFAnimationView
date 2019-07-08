import UIKit

extension UIImage {
    public static func animationImage(name: String) -> UIImage? {
        
        guard let gifPath = Bundle.main.url(forResource: name, withExtension: "gif") else { return nil }
        guard let data = try? Data(contentsOf: gifPath) else { return nil }
        
        return UIImage(data: data)
    }
}
