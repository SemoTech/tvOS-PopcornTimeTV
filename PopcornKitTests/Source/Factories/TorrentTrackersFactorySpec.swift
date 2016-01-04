import Foundation
import Quick
import Nimble

@testable import PopcornKit

class TorrentTrackerFactorySpec: QuickSpec {
    override func spec() {
        
        var subject: TorrentTrackersFactory?
        var plistReader: MockPlistReader?
        
        it("should return the trackers if the plist could be read") {
            plistReader = MockPlistReader(array: ["tracker1"])
            subject = TorrentTrackersFactory(plistReader: plistReader!)
            expect(subject?.defaultTrackers()) == ["tracker1"]
        }
        
        it("should return an empty array of trackers if the list of trackers can't be read") {
            plistReader = MockPlistReader(array: [2])
            subject = TorrentTrackersFactory(plistReader: plistReader!)
            expect(subject?.defaultTrackers()) == []
        }
        
    }
}

class MockPlistReader: PlistReader {
    
    let array: [AnyObject]
    let dictionary: [NSObject: AnyObject]
    
    init(array: [AnyObject] = [], dictionary: [NSObject: AnyObject] = [:]) {
        self.array = array
        self.dictionary = dictionary
    }
    
    override func readArrayFromPlist(name: String) -> [AnyObject] {
        return self.array
    }
    
    override func readDictionaryFromPlist(name: String) -> [NSObject : AnyObject] {
        return self.dictionary
    }
}