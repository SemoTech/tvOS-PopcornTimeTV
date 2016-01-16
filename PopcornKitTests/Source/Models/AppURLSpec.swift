import Foundation
import Quick
import Nimble

@testable import PopcornKit

class AppURLSpec: QuickSpec {
    override func spec() {
        
        describe("url generation") {
            
            context("movie") {
                it("should generate a valid url") {
                    expect(AppURL.Movie(movieId: 3).toURL()?.absoluteString) == "popcorn://movies/3"
                }
            }
            
            context("unknown") {
                it("shouldn't generate an URL") {
                    expect(AppURL.Unknown.toURL()).to(beNil())
                }
            }
            
        }
        
        describe("init") {
            
            context("popcorn://movies/3") {
                it("should generate a valid AppURL") {
                    let appUrl = AppURL(url: NSURL(string: "popcorn://movies/3")!)
                    switch appUrl {
                    case .Movie(let movieId):
                        expect(movieId) == 3
                    default:
                        expect(true) == false
                    }
                }
            }
            
            context("invalid url") {
                it("should generate an unknown AppURL") {
                    let appUrl = AppURL(url: NSURL(string: "popcoASDGAovies/3")!)
                    switch appUrl {
                    case .Unknown:
                        expect(true) == true
                    default:
                        expect(true) == false
                    }
                }
            }
            
        }
        
        
    }
}