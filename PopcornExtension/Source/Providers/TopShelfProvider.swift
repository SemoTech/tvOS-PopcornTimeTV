import Foundation
import TVServices
import PopcornKit
import RXCommander

public class TopShelfProvider: NSObject, TVTopShelfProvider {

    // MARK: - TVTopShelfProvider protocol

    public var topShelfStyle: TVTopShelfContentStyle {
        return TVTopShelfContentStyle.Sectioned
    }

    public var topShelfItems: [TVContentItem] {
        let command = YTSCommandFactory().indexMoviesCommand()
        let queue: CommandQueue = CommandQueue.backgroundQueue
        let adapter: TVContentItemAdapter = TVContentItemAdapter()
        let semaphore = dispatch_semaphore_create(0)
        var items: [TVContentItem] = []
        _ = queue.addCommand(command).map({$0.0.data?.movies.map(adapter.adapt) ?? [] }).subscribe({ (event) -> Void in
            switch event {
            case .Next(let _items):
                let sectionItem = TVContentItem(contentIdentifier: TVContentIdentifier(identifier: "", container: nil)!)!
                sectionItem.title = "Last Movies"
                sectionItem.topShelfItems = _items
                items = [sectionItem]
            default: break
            }
            dispatch_semaphore_signal(semaphore)
        })
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        return items
    }

}

