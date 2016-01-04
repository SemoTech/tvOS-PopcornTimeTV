import Foundation
import PopcornKit

internal class PlayerViewFactory {
    
    internal func playerView(withTorrent torrent: APITorrent, movie: APIMovie) -> UIViewController {
        let view: PlayerView = PlayerView()
        _ = PlayerPresenter(torrent: torrent, movie: movie, view: view)
        return view
    }

}