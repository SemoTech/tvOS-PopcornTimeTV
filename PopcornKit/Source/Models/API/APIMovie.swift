import Foundation
import Genome

/**
 *  APIMovie
 */
public struct APIMovie: BasicMappable, Equatable {
    
    // MARK: - Attributes
    
    public var id: Int = -1
    public var url: String = ""
    public var title: String = ""
    public var titleEnglish: String = ""
    public var titleLong: String = ""
    public var slug: String = ""
    public var year: Int = -1
    public var rating: Float = 0.0
    public var runtime: Int = -1
    public var genres: [String] = []
    public var summary: String = ""
    public var descriptionFull: String = ""
    public var sinopsis: String? = ""
    public var ytTrailerCode: String = ""
    public var language: String = ""
    public var mpaRating: String = ""
    public var backgroundImage: String = ""
    public var backgroundImageOriginal: String = ""
    public var smallCoverImage: String = ""
    public var mediumCoverImage: String = ""
    public var largeCoverImage: String = ""
    public var torrents: [APITorrent] = []
    public var dateUploaded: NSDate? = NSDate()
    
    
    // MARK: - Init
    
    public init() {}
    
    
    // MARK: - BasicMappable
    
    mutating public func sequence(map: Map) throws {
        try id <~ map["id"]
        try url <~ map["url"]
        try title <~ map["title"]
        try titleEnglish <~ map["title_english"]
        try titleLong <~ map["title_long"]
        try slug <~ map["slug"]
        try year <~ map["year"]
        try rating <~ map["rating"]
        try runtime <~ map["runtime"]
        try genres <~ map["genres"]
        try summary <~ map["summary"]
        try descriptionFull <~ map["description_full"]
        sinopsis  = try <~map["sinopsis"]
        try ytTrailerCode <~ map["yt_trailer_code"]
        try language <~ map["language"]
        try mpaRating <~ map["mpa_rating"]
        try backgroundImage <~ map["background_image"]
        try backgroundImageOriginal <~ map["background_image_original"]
        try smallCoverImage <~ map["small_cover_image"]
        try mediumCoverImage <~ map["medium_cover_image"]
        try largeCoverImage <~ map["large_cover_image"]
        try torrents <~ map["torrents"]
        if let dateUploadedUnix: NSTimeInterval  = try <~map["date_uploaded_unix"] {
            dateUploaded = NSDate(timeIntervalSince1970: dateUploadedUnix)
        }
    }
}


// MARK: - Equatable

public func == (lhs: APIMovie, rhs: APIMovie) -> Bool {
    return lhs.id == rhs.id
}
