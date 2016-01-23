import Foundation
import Quick
import Nimble
import Genome
import PureJsonSerializer

@testable import PopcornKit

class APITorrentSpec: QuickSpec {
    override func spec() {
        
        var torrent: APITorrent?
        var jsonTorrent: Json?
        
        beforeSuite {
            jsonTorrent = try! Json.deserialize(readJSON("torrent"))
            torrent = try! APITorrent.newInstance(jsonTorrent!)
        }
        
        context("mapping") {

            it("should have the correct url") {
                expect(torrent?.url) == (jsonTorrent!["url"]?.stringValue)
            }
            
            it("should have the correct hash") {
                expect(torrent?.hash) == (jsonTorrent!["hash"]?.stringValue)
            }
            
            it("should have the correct quality") {
                expect(torrent?.quality) == (jsonTorrent!["quality"]?.stringValue)
            }
            
            it("should have the correct seeds") {
                expect(torrent?.seeds) == (jsonTorrent!["seeds"]?.intValue)
            }
            
            it("should have the correct peers") {
                expect(torrent?.peers) == (jsonTorrent!["peers"]?.intValue)
            }
            
            it("should have the correct size") {
                expect(torrent?.size) == (jsonTorrent!["size"]?.stringValue)
            }
            
            it("should have the correct size_bytes") {
                expect(torrent?.sizeBytes) == (jsonTorrent!["size_bytes"]?.intValue)
            }
            
            it("should have the correct date_uploaded") {
                expect(torrent?.dateUploaded.timeIntervalSince1970) == (jsonTorrent!["date_uploaded_unix"]?.doubleValue)
            }
        }
    
    }
}