import Foundation

func readJSON(name: String) -> AnyObject {
    let data = NSData(contentsOfURL: NSBundle(forClass: APIMovieSpec.classForCoder()).URLForResource(name, withExtension: "json")!)
    return try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
}