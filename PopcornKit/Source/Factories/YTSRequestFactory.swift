import Foundation
import RXHTTPCommander
import Alamofire

public class YTSRequestFactory: HTTPRequestFactory {
 
    // MARK: - Attributes
    
    public let baseURL: NSURL
    public let headers: [String: String]
    
    
    // MARK: - Init
    
    public init(baseURL: NSURL, headers: [String: String] = [:]) {
        self.baseURL = baseURL
        self.headers = headers
    }
    
    
    // MARK: - Public
    
    public func indexMovies(limit limit: Int = 20, page: Int = 1, quality: String? = nil, minimumRating: Int = 0, queryTerm: String? = nil, genre: String? = nil, sortBy: String = "date_added", orderBy: String = "desc") -> HTTPRequestable {
        let parameters = indexMoviewsParameters(limit, page: page, quality: quality, minimumRating: minimumRating, queryTerm: queryTerm, genre: genre, sortBy: sortBy, orderBy: orderBy)
        return self.get("api/v2/list_movies.json", parameters: parameters, parameterEncoding: ParameterEncoding.URLEncodedInURL)
    }
    
    public func showMovie(movieId movieId: String, withImages: Bool = false, withCast: Bool = false) -> HTTPRequestable {
        let parameters = showMovieParameters(movieId: movieId, withImages: withImages, withCast: withCast)
        return self.get("api/v2/list_movies.json", parameters: parameters, parameterEncoding: ParameterEncoding.URLEncodedInURL)
    }
    
    
    // MARK: - Private
    
    private func indexMoviewsParameters(limit: Int = 20, page: Int = 1, quality: String? = nil, minimumRating: Int = 0, queryTerm: String? = nil, genre: String? = nil, sortBy: String = "date_added", orderBy: String = "desc") -> [String: AnyObject] {
        var parameters: [String: AnyObject] = [:]
        parameters["limit"] = limit
        parameters["page"] = page
        if let quality = quality {
            parameters["quality"] = quality
        }
        parameters["minimum_rating"] = minimumRating
        if let queryTerm = queryTerm {
            parameters["query_term"] = queryTerm
        }
        if let genre = genre {
            parameters["genre"] = genre
        }
        parameters["sort_by"] = sortBy
        parameters["order_by"] = orderBy
        return parameters
    }
    
    private func showMovieParameters(movieId movieId: String, withImages: Bool = false, withCast: Bool = false) -> [String: AnyObject] {
        var parameters: [String: AnyObject] = [:]
        parameters["movie_id"] = movieId
        parameters["with_images"] = withImages
        parameters["with_cast"] = withCast
        return parameters
    }
    
}