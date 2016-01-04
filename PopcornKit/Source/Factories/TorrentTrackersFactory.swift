import Foundation

/// Torrent trackers factory
public class TorrentTrackersFactory {
    
    private static let trackersPlistName: String = "Trackers"
    
    
    // MARK: - Attributes
    
    private let plistReader: PlistReader
    
    
    // MARK: - Inint
    
    internal init(plistReader: PlistReader) {
        self.plistReader = plistReader
    }
    
    public convenience init() {
        self.init(plistReader: PlistReader())
    }
    
    
    // MARK: - Public
    
    public func defaultTrackers() -> [String] {
        if let trackers = plistReader.readArrayFromPlist(TorrentTrackersFactory.trackersPlistName) as? [String] {
            return trackers
        }
        return []
    }
}