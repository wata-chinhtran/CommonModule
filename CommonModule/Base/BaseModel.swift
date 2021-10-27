
import Foundation

public struct BaseModel: Codable, PropertyNames {
    var id: String = ""
}

protocol PropertyNames {
    func propertyNames() -> [String]
}

extension PropertyNames
{
    func propertyNames() -> [String] {
        return Mirror(reflecting: self).children.compactMap { $0.label }
    }
}

public struct LSResponse<T: Codable> {
    let data: T?
    let error: LSErrorResponse?
}
