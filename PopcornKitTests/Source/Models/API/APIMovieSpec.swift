import Foundation
import Quick
import Nimble
import Genome

@testable import PopcornKit

class APIMovieSpec: QuickSpec {
    override func spec() {
        
        var movie: APIMovie?
        var jsonMovie: JSON?
        
        beforeSuite {
            jsonMovie = readJSON("movie") as? JSON
            movie = try! APIMovie.mappedInstance(jsonMovie!)
        }
        
        context("mapping") {
            
            it("should have the correct id") {
                expect(movie?.id) == (jsonMovie!["id"] as? Int)
            }
            
            it("should have the correct url") {
                expect(movie?.url) == (jsonMovie!["url"] as? String)
            }
            
            it("should have the correct title") {
                expect(movie?.title) == (jsonMovie!["title"] as? String)
            }
            
            it("should have the correct title_english") {
                expect(movie?.titleEnglish) == (jsonMovie!["title_english"] as? String)
            }
            
            it("should have the correct title_long") {
                expect(movie?.titleLong) == (jsonMovie!["title_long"] as? String)
            }
            
            it("should have the correct slug") {
                expect(movie?.slug) == (jsonMovie!["slug"] as? String)
            }
            
            it("should have the correct year") {
                expect(movie?.year) == (jsonMovie!["year"] as? Int)
            }
            
            it("should have the correct rating") {
                expect(movie?.rating) == (jsonMovie!["rating"] as? Float)
            }
            
            it("should have the correct runtime") {
                expect(movie?.runtime) == (jsonMovie!["runtime"] as? Int)
            }
            
            it("should have the correct genres") {
                expect(movie?.genres) == (jsonMovie!["genres"] as? [String])
            }
            
            it("should have the correct summary") {
                expect(movie?.summary) == (jsonMovie!["summary"] as? String)
            }
            
            it("should have the correct description_full") {
                expect(movie?.descriptionFull) == (jsonMovie!["description_full"] as? String)
            }
            
            it("should have the correct sinopsis") {
                if let sinopsis = (jsonMovie!["sinopsis"] as? String) {
                    expect(movie?.sinopsis) == sinopsis
                }
                else {
                    expect(movie?.sinopsis).to(beNil())
                }
            }
            
            it("should have the correct yt_trailer_code") {
                expect(movie?.ytTrailerCode) == (jsonMovie!["yt_trailer_code"] as? String)
            }
            
            it("should have the correct language") {
                expect(movie?.language) == (jsonMovie!["language"] as? String)
            }
            
            it("should have the correct mpa_rating") {
                expect(movie?.mpaRating) == (jsonMovie!["mpa_rating"] as? String)
            }
            
            it("should have the correct background_image") {
                expect(movie?.backgroundImage) == (jsonMovie!["background_image"] as? String)
            }
            
            it("should have the correct background_image_original") {
                expect(movie?.backgroundImageOriginal) == (jsonMovie!["background_image_original"] as? String)
            }
            
            it("should have the correct small_cover_image") {
                expect(movie?.smallCoverImage) == (jsonMovie!["small_cover_image"] as? String)
            }
            
            it("should have the correct medium_cover_image") {
                expect(movie?.mediumCoverImage) == (jsonMovie!["medium_cover_image"] as? String)
            }
            
            it("should have the correct large_cover_image") {
                expect(movie?.largeCoverImage) == (jsonMovie!["large_cover_image"] as? String)
            }
            
            it("should have the correct torrents") {
                expect(movie?.torrents.map({$0.hash})) == (jsonMovie!["torrents"] as? [JSON])?.map({$0["hash"] as! String})
            }
            
            it("should have the correct date_uploaded") {
                expect(movie?.dateUploaded.timeIntervalSince1970) == (jsonMovie!["date_uploaded_unix"] as? NSTimeInterval)
            }
        }
    
    }
}