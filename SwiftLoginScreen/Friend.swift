import Foundation

class Friend: NSObject {
    let id: String
    let name: String
    let thumbnails: String
    let articles: String
    
    init(id: String, name: String, thumbnails: String, articles: String) {
        self.id = id;
        self.name = name;
        self.thumbnails = thumbnails;
        self.articles = articles;
    }
}

