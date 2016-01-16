import Foundation
import RXHTTPCommander
import RxSwift
import Genome
import RXCommander

public class YTSCommandFactory {

    private static let defaultBaseURL: String = "https://yts.ag"
    
    // MARK: - Attributes
    
    private let requestFactory: YTSRequestFactory

    
    // MARK: - Init
    
    internal init(requestFactory: YTSRequestFactory) {
        self.requestFactory = requestFactory
    }
    
    public convenience init(baseURL: NSURL = NSURL(string: YTSCommandFactory.defaultBaseURL)!, headers: [String: String] = [:]) {
        self.init(requestFactory: YTSRequestFactory(baseURL: baseURL, headers: headers))
    }
    
    
    // MARK: - Public
    
    public func indexMoviesCommand(limit limit: Int = 20, page: Int = 1, quality: String? = nil, minimumRating: Int = 0, queryTerm: String? = nil, genre: String? = nil, sortBy: String = "date_added", orderBy: String = "desc") -> YTSHTTPCommand<APIMoviesCollection> {
        let requestable = requestFactory.indexMovies(limit: limit, page: page, quality: quality, minimumRating: minimumRating, queryTerm: queryTerm, genre: genre, sortBy: sortBy, orderBy: orderBy)
        return YTSHTTPCommand<APIMoviesCollection>(requestable: requestable)
    }
    
    public func showMovieCommand(movieId movieId: String, withImages: Bool = false, withCast: Bool = false) -> YTSHTTPCommand<APIMovie> {
        let requestable = requestFactory.showMovie(movieId: movieId, withImages: withImages, withCast: withCast)
        return YTSHTTPCommand<APIMovie>(requestable: requestable)
    }

    public func indexSuggestionsCommand(movieId movieId: String) -> YTSHTTPCommand<APIMoviesCollection> {
        let requestable = requestFactory.indexSuggestions(movieId: movieId)
        return YTSHTTPCommand<APIMoviesCollection>(requestable: requestable)
    }

    public func indexUpcomingCommand() -> YTSHTTPCommand<APIMoviesCollection> {
        let requestable = requestFactory.indexUpcoming()
        return YTSHTTPCommand<APIMoviesCollection>(requestable: requestable)
    }

}


public class YTSHTTPCommand<T: BasicMappable>: Command<(APIResponse<T>, NSURLResponse)> {
    
    // MARK: - Attributes
    
    private let httpCommand: HTTPCommand<AnyObject>
    
    
    // MARK: - Init
    
    private init(requestable: HTTPRequestable) {
        self.httpCommand = HTTPCommandFactory(requestable: requestable).jsonCommand()
    }
    
    
    // MARK: - Command
    
    public override func action() throws -> (APIResponse<T>, NSURLResponse) {
        let httpOutput = try self.httpCommand.action()
        return try (APIResponse<T>.mappedInstance(httpOutput.0 as! JSON), httpOutput.1)
    }
}