import UIKit
import AVKit
import AVFoundation
import PopcornTorrent

internal class PlayerView: AVPlayerViewController {

    // MARK: - Attributes
    
    internal var presenter: PlayerPresenter?
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var started: Bool = false
        var u: NSURL? = nil
        
        PTTorrentStreamer.sharedStreamer().startStreamingFromFileOrMagnetLink("magnet:?xt=urn:btih:FFBB53E265BFAC41E293F9C13C6C523BC28CEB8B", progress: { (status) -> Void in
            print("Status: \(status)")
            if started { return }
            guard let _url = u else { return }
            if status.totalProgreess < 0.01 { return }
            self.player = AVPlayer(URL: _url)
            self.player?.play()
            started = true
            }, readyToPlay: { (url) -> Void in
                u = url
                print("Ready to play \(url)")
            }) { (error) -> Void in
                print("Error: \(error)")
        }
        
    }
    
    // MARK: - Internal
    
    

}

