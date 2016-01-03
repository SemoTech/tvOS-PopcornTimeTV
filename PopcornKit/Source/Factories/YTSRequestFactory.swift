import Foundation
import RXHTTPCommander

public class YTSRequestFactory: HTTPRequestFactory {
 
    // MARK: - Attributes
    
    public let baseURL: NSURL
    public let headers: [String: String]
    
    
    // MARK: - Init
    
    public init(baseURL: NSURL, headers: [String: String] = [:]) {
        self.baseURL = baseURL
        self.headers = headers
    }
    
}