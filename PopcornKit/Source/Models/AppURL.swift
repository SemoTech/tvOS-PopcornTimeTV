import Foundation

public enum AppURL {
    
    case Movie(movieId: Int)
    case Unknown
    
    
    // MARK: - Init
    
    init(url: NSURL) {
        if url.absoluteString.containsString("popcorn://movies/") {
            let movieId =  url.absoluteString.stringByReplacingOccurrencesOfString("popcorn://movies/", withString: "")
            self = AppURL.Movie(movieId: Int(movieId)!)
        }
        else {
            self = AppURL.Unknown
        }
    }
    
    
    // MARK: - Public
    
    /**
     Generates the App NSURL.
     
     - returns: NSURL that can be processed by the app.
     */
    public func toURL() -> NSURL? {
        switch self {
        case .Movie(let movieId):
            return NSURL(string: "popcorn://movies/\(movieId)")
        case .Unknown:
            return nil
        }
    }
}