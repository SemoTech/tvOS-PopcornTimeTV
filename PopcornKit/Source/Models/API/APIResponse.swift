import Foundation
import Genome

/**
 *  APIResponse
 */
public struct APIResponse<T: BasicMappable>: BasicMappable {
    
    // MARK: - Attributes
    
    public var status: String = ""
    public var statusMessage: String = ""
    public var data: T?
    
    
    // MARK: - Init
    
    public init() {}
    
    
    // MARK: - BasicMappable
    
    mutating public func sequence(map: Map) throws {
        try status <~ map["status"]
        try statusMessage <~ map["status_message"]
        try data <~ map["data"]
    }
}