import Foundation
import TVServices

/**
 *  Adapts a Movie into a TVContentItem
 */
struct TVContentItemAdapter {
    
    /**
     Adapts the movie into a TVContentItem.
     
     - parameter movie: Movie to be adapted.
     
     - returns: Created TVContentItem from the Movie.
     */
    func adapt(movie: APIMovie) -> TVContentItem {
        let contentItem = TVContentItem(contentIdentifier: TVContentIdentifier(identifier: "\(movie.id)", container: nil)!)!
        contentItem.imageURL = NSURL(string: movie.backgroundImage)
        contentItem.imageShape = TVContentItemImageShape.Poster
        contentItem.title = movie.title
        contentItem.duration = movie.runtime * 60
        contentItem.displayURL = AppURL.Movie(movieId: movie.id).toURL()
        return contentItem
    }
    
}