import Foundation
import Quick
import Nimble
import TVServices

@testable import PopcornKit

class TVContentItemAdapterSpec: QuickSpec {
    override func spec() {
        
        var movie: APIMovie?
        var subject: TVContentItemAdapter?
        var contentItem: TVContentItem?
        
        beforeSuite {
            movie = APIMovie()
            movie?.id = 44
            movie?.backgroundImage = "http://image.com/image.jpg"
            movie?.title = "Star Wars"
            movie?.runtime = 100
            subject = TVContentItemAdapter()
            contentItem = subject!.adapt(movie!)
        }
        
        describe("adapt") {
            
            it("should have the correct content identifier") {
                expect(contentItem?.contentIdentifier.identifier) == "\(movie!.id)"
            }
            
            it("should have the correct image URL") {
                expect(contentItem?.imageURL?.absoluteString) == movie?.largeCoverImage
            }
            
            it("should have Poster as image shape") {
                expect(contentItem?.imageShape) == .Poster
            }
            
            it("should have the correct title") {
                expect(contentItem?.title) == movie?.title
            }
            
            it("should have the correct duration") {
                expect(contentItem?.duration) == movie!.runtime*60
            }
            
            it("should ahave the correct display URL") {
                expect(contentItem?.displayURL) == AppURL.Movie(movieId: movie!.id).toURL()
            }
        }
    }
}