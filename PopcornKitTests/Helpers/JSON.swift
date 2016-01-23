import Foundation

func readJSON(name: String) -> NSData {
    let data = NSData(contentsOfURL: NSBundle(forClass: APIMovieSpec.classForCoder()).URLForResource(name, withExtension: "json")!)
    return data!
}