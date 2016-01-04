import Foundation

class PlistReader: NSObject {
    
    
    // MARK: Internal
    
    func readArrayFromPlist(name: String) -> [AnyObject] {
        // TODO
       return []
    }
    
    func readDictionaryFromPlist(name: String) -> [NSObject: AnyObject] {
        // TODO
        return [:]
    }
    
    
    // MARK: - Private
    
    private func bundle() -> NSBundle {
        return NSBundle(forClass: PlistReader.classForCoder())
    }
    
}