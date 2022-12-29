
import Foundation

// MARK: - AllCategoriesResponse
struct AllCategoriesResponse: Codable {
    let categories: Categories
}

// MARK: - Categories
struct Categories: Codable {
    let items: [Category]
}

// MARK: - Item
struct Category: Codable {
    let icons: [APIImage] //[Icon]
    let id, name: String
}
