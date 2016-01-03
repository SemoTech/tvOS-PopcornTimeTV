import Foundation
import Quick
import Nimble
import RXHTTPCommander

@testable import PopcornKit

class YTSRequestFactorySpec: QuickSpec {
    override func spec() {
        
        var subject: YTSRequestFactory?
        var baseUrl: NSURL = NSURL(string: "")!
        var headers: [String: String] = [:]
        
        beforeSuite {
            baseUrl = NSURL(string: "https://test.com")!
            headers = [:]
            subject = YTSRequestFactory(baseURL: baseUrl, headers: headers)
        }
        
        describe("indexMovies") {
            
            var request: HTTPRequestable?
            var limit: Int = 0
            var page: Int = 0
            var minimumRating: Int = 0
            var quality: String = ""
            var queryTerm: String = ""
            var genre: String = ""
            var sortBy: String = ""
            var orderBy: String = ""
            
            beforeSuite {
                limit = 20
                page = 3
                quality = "720p"
                minimumRating = 5
                queryTerm = "starwars"
                genre = "action"
                sortBy = "name"
                orderBy = "date"
                request = subject?.indexMovies(limit: limit, page: page, quality: quality, minimumRating: minimumRating, queryTerm: queryTerm, genre: genre, sortBy: sortBy, orderBy: orderBy)
            }
            
            it("should build the request correctly") {
                let url: String? = request?.request().URL?.absoluteString
                expect(url) == "https://test.com/api/v2/list_movies.json?genre=action&limit=20&minimum_rating=5&order_by=date&page=3&quality=720p&query_term=starwars&sort_by=name"
            }
        }
        
        describe("showMovie") {
            var request: HTTPRequestable?
            var movieId: String = ""
            var withImages: Bool = false
            var withCast: Bool = false
            
            beforeSuite {
                movieId = "333"
                withImages = true
                withCast = true
                request = subject?.showMovie(movieId: movieId, withImages: withImages, withCast: withCast)
            }
            
            it("should build the request correctly") {
                let url: String? = request?.request().URL?.absoluteString
                expect(url) == "https://test.com/api/v2/list_movies.json?movie_id=333&with_cast=1&with_images=1"
            }
        }
    }
}