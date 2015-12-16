import Foundation

class Friend: NSObject {
    let id: String
    let name: String
    let thumbnails: String
    let prepTime: String
    
    init(id: String, name: String, thumbnails: String, prepTime: String) {
        self.id = id;
        self.name = name
        self.thumbnails = thumbnails
        self.prepTime = prepTime
    }
}

