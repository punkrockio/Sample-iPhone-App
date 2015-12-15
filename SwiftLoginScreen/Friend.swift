import Foundation

class Friend: NSObject {
    let name: String
    let thumbnails: String
    let prepTime: String
    
    init(name: String, thumbnails: String, prepTime: String) {
        self.name = name
        self.thumbnails = thumbnails
        self.prepTime = prepTime
    }
}

