import Foundation

internal class PlistReader: NSObject {
    
    // MARK: - Attributes
    
    private let bundle: NSBundle
    
    
    // MARK: - Init
    
    internal init(bundle: NSBundle = NSBundle(forClass: PlistReader.classForCoder())) {
        self.bundle = bundle
    }
    
    
    // MARK: Internal
    
    internal func readArrayFromPlist(name: String) -> [AnyObject] {
       return NSArray(contentsOfFile: self.bundle.pathForResource(name, ofType: "plist")!)! as [AnyObject]
    }
    
    internal func readDictionaryFromPlist(name: String) -> [NSObject: AnyObject] {
        return NSDictionary(contentsOfFile: self.bundle.pathForResource(name, ofType: "plist")!)! as [NSObject: AnyObject]
    }
}