import Foundation
import Quick
import Nimble
import Genome

@testable import PopcornKit

class APITorrentSpec: QuickSpec {
    override func spec() {
        
        var torrent: APITorrent?
        var jsonTorrent: JSON?
        
        beforeSuite {
            jsonTorrent = readJSON("torrent") as? JSON
            torrent = try! APITorrent.mappedInstance(jsonTorrent!)
        }
        
        context("mapping") {

            it("should have the correct url") {
                expect(torrent?.url) == (jsonTorrent!["url"] as? String)
            }
            
            it("should have the correct hash") {
                expect(torrent?.hash) == (jsonTorrent!["hash"] as? String)
            }
            
            it("should have the correct quality") {
                expect(torrent?.quality) == (jsonTorrent!["quality"] as? String)
            }
            
            it("should have the correct seeds") {
                expect(torrent?.seeds) == (jsonTorrent!["seeds"] as? Int)
            }
            
            it("should have the correct peers") {
                expect(torrent?.peers) == (jsonTorrent!["peers"] as? Int)
            }
            
            it("should have the correct size") {
                expect(torrent?.size) == (jsonTorrent!["size"] as? String)
            }
            
            it("should have the correct size_bytes") {
                expect(torrent?.sizeBytes) == (jsonTorrent!["size_bytes"] as? Int)
            }
            
            it("should have the correct date_uploaded") {
                expect(torrent?.dateUploaded.timeIntervalSince1970) == (jsonTorrent!["date_uploaded_unix"] as? NSTimeInterval)
            }
        }
    
    }
}