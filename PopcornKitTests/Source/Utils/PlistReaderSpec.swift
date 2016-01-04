import Foundation
import Quick
import Nimble

@testable import PopcornKit

class PlistReaderSpec: QuickSpec {
    override func spec() {
        
        var subject: PlistReader?
        
        beforeSuite {
            subject = PlistReader(bundle: NSBundle(forClass: PlistReaderSpec.classForCoder()))
        }
        
        it("should properly read array plists") {
            expect(subject?.readArrayFromPlist("array") as? [String]) == ["test1"]
        }
        
        it("should properly read dictionary plists") {
            expect(subject?.readDictionaryFromPlist("dictionary") as? [String: String]) == ["test1": "value1"]
        }
        
    }
}