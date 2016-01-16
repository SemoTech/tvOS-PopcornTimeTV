import Foundation
import TVServices

/**
 *  Adapts a Movie into a TVContentItem
 */
public struct TVContentItemAdapter {
    
    // MARK: - Init
    
    public init() {}
    
    
    // MARK: - Public
    
    /**
     Adapts the movie into a TVContentItem.
     
     - parameter movie: Movie to be adapted.
     
     - returns: Created TVContentItem from the Movie.
     */
    public func adapt(movie: APIMovie) -> TVContentItem {
        let contentItem = TVContentItem(contentIdentifier: TVContentIdentifier(identifier: "\(movie.id)", container: nil)!)!
        contentItem.imageURL = NSURL(string: movie.largeCoverImage)
        contentItem.imageShape = TVContentItemImageShape.Poster
        contentItem.title = movie.title
        contentItem.duration = movie.runtime * 60
        contentItem.displayURL = AppURL.Movie(movieId: movie.id).toURL()
        return contentItem
    }
    
}