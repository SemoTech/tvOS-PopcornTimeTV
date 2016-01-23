import Foundation
import Quick
import Nimble
import Genome
import PureJsonSerializer

@testable import PopcornKit

class APIMovieSpec: QuickSpec {
    override func spec() {
        
        var movie: APIMovie?
        var jsonMovie: Json?
        
        beforeSuite {
            jsonMovie = try! Json.deserialize(readJSON("movie"))
            movie = try! APIMovie.newInstance(jsonMovie!)
        }
        
        context("mapping") {
            
            it("should have the correct id") {
                expect(movie?.id) == (jsonMovie!["id"]?.intValue)
            }
            
            it("should have the correct url") {
                expect(movie?.url) == (jsonMovie!["url"]?.stringValue)
            }
            
            it("should have the correct title") {
                expect(movie?.title) == (jsonMovie!["title"]?.stringValue)
            }
            
            it("should have the correct title_english") {
                expect(movie?.titleEnglish) == (jsonMovie!["title_english"]?.stringValue)
            }
            
            it("should have the correct title_long") {
                expect(movie?.titleLong) == (jsonMovie!["title_long"]?.stringValue)
            }
            
            it("should have the correct slug") {
                expect(movie?.slug) == (jsonMovie!["slug"]?.stringValue)
            }
            
            it("should have the correct year") {
                expect(movie?.year) == (jsonMovie!["year"]?.intValue)
            }
            
            it("should have the correct rating") {
                expect(movie?.rating) == (jsonMovie!["rating"]?.floatValue)
            }
            
            it("should have the correct runtime") {
                expect(movie?.runtime) == (jsonMovie!["runtime"]?.intValue)
            }
            
            it("should have the correct genres") {
                expect(movie?.genres) == (jsonMovie!["genres"]!.arrayValue!.map({$0.stringValue!}))
            }
            
            it("should have the correct summary") {
                expect(movie?.summary) == (jsonMovie!["summary"]?.stringValue)
            }
            
            it("should have the correct description_full") {
                expect(movie?.descriptionFull) == (jsonMovie!["description_full"]?.stringValue)
            }
            
            it("should have the correct sinopsis") {
                if let sinopsis = (jsonMovie!["sinopsis"]?.stringValue) {
                    expect(movie?.sinopsis) == sinopsis
                }
                else {
                    expect(movie?.sinopsis).to(beNil())
                }
            }
            
            it("should have the correct yt_trailer_code") {
                expect(movie?.ytTrailerCode) == (jsonMovie!["yt_trailer_code"]?.stringValue)
            }
            
            it("should have the correct language") {
                expect(movie?.language) == (jsonMovie!["language"]?.stringValue)
            }
            
            it("should have the correct mpa_rating") {
                expect(movie?.mpaRating) == (jsonMovie!["mpa_rating"]?.stringValue)
            }
            
            it("should have the correct background_image") {
                expect(movie?.backgroundImage) == (jsonMovie!["background_image"]?.stringValue)
            }
            
            it("should have the correct background_image_original") {
                expect(movie?.backgroundImageOriginal) == (jsonMovie!["background_image_original"]?.stringValue)
            }
            
            it("should have the correct small_cover_image") {
                expect(movie?.smallCoverImage) == (jsonMovie!["small_cover_image"]?.stringValue)
            }
            
            it("should have the correct medium_cover_image") {
                expect(movie?.mediumCoverImage) == (jsonMovie!["medium_cover_image"]?.stringValue)
            }
            
            it("should have the correct large_cover_image") {
                expect(movie?.largeCoverImage) == (jsonMovie!["large_cover_image"]?.stringValue)
            }
            
            it("should have the correct torrents") {
                expect(movie?.torrents.map({$0.hash})) == (jsonMovie!["torrents"]?.arrayValue)?.map({$0["hash"]!.stringValue!})
            }
            
            it("should have the correct date_uploaded") {
                expect(movie?.dateUploaded!.timeIntervalSince1970) == (jsonMovie!["date_uploaded_unix"]?.doubleValue)
            }
        }
    
    }
}