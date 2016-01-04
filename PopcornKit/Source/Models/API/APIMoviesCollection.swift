import Foundation
import Genome

/**
 *  APIMoviesCollection
 */
public struct APIMoviesCollection: BasicMappable, Equatable {
    
    // MARK: - Attributes
    
    public var movieCount: Int = 0
    public var limit: Int = 0
    public var pageNumber: Int = 0
    public var movies: [APIMovie] = []
    
    
    // MARK: - Init
    
    public init() {}
    
    
    // MARK: - BasicMappable
    
    mutating public func sequence(map: Map) throws {
        try movieCount <~ map["movie_count"]
        try limit <~ map["limit"]
        try pageNumber <~ map["page_number"]
        try movies <~ map["movies"]
    }
}


// MARK: - Equatable

public func == (lhs: APIMoviesCollection, rhs: APIMoviesCollection) -> Bool {
    return
        lhs.movieCount == rhs.movieCount &&
        lhs.limit == rhs.limit &&
        lhs.pageNumber == rhs.pageNumber &&
        lhs.movies == rhs.movies
}