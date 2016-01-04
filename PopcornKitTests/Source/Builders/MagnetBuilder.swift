import Foundation

public struct MagnetBuilder {
    
    // MARK: - Attributes
    
    private let torrent: APITorrent
    private let movie: APIMovie
    private let trackers: [String]
    
    
    // MARK: - Init
    
    public init(torrent: APITorrent, movie: APIMovie, trackers: [String] = []) {
        self.torrent = torrent
        self.movie = movie
        self.trackers = trackers
    }
    
    
    // MARK: - Public
    
    public func build() -> String {
        let baseLink: String = "magnet:?xt=urn:btih:\(torrentHash())&dn=\(torrentEncodedName())"
        return trackers.reduce(baseLink, combine: { "\($0)&tr=\($1)"})
    }
    
    
    // MARK: - Private
    
    private func torrentHash() -> String {
        return self.torrent.hash
    }
    
    private func torrentEncodedName() -> String {
        // TODO - Review
        return movie.slug
    }
}