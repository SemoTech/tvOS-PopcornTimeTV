import Foundation
import Genome

/**
 *  APITorrent
 */
public struct APITorrent: BasicMappable, Equatable {
    
    // MARK: - Attributes
    
    public var url: String = ""
    public var hash: String = ""
    public var quality: String  = ""
    public var seeds: Int = 0
    public var peers: Int = 0
    public var size: String = ""
    public var sizeBytes: Int = 0
    public var dateUploaded: NSDate = NSDate()
    
    
    // MARK: - Init
    
    public init() {}
    
    
    // MARK: - BasicMappable
    
    mutating public func sequence(map: Map) throws {
        try url <~ map["url"]
        try hash <~ map["hash"]
        try quality <~ map["quality"]
        try seeds <~ map["seeds"]
        try peers <~ map["peers"]
        try size <~ map["size"]
        try sizeBytes <~ map["size_bytes"]
        try dateUploaded <~ map["date_uploaded_unix"].transformFromJson({ NSDate(timeIntervalSince1970: $0) })
    }
}

public func == (lhs: APITorrent, rhs: APITorrent) -> Bool {
    return lhs.hash == rhs.hash
}