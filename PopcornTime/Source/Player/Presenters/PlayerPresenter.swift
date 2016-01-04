import Foundation
import PopcornKit

internal class PlayerPresenter {

 
    // MARK: - Attributes
    
    private var view: PlayerView? = nil
    private let torrent: APITorrent
    private let movie: APIMovie
    
    
    // MARK: - Init
    
    init(torrent: APITorrent, movie: APIMovie, view: PlayerView) {
        self.view = view
        self.torrent = torrent
        self.movie = movie
        self.view?.presenter = self
    }
    
}