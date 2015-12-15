import Foundation

class Blog: NSObject {
    let authour: Friend
    let title: String
    let thumbnail: String
    let blurb: String
    let fulltext: String
    
    init(authour: Friend, title: String, thumbnail: String, blurb: String, fulltext: String) {
        self.authour = authour
        self.title = title
        self.thumbnail = thumbnail
        self.blurb = blurb
        self.fulltext = fulltext
    }
}

