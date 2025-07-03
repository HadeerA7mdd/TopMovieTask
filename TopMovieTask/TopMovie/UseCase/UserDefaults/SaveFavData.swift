//
//  SaveFavData.swift
//  TopMovie
//
//  Created by Hader on 02/07/2025.
//

import Foundation

class FavoriteManager {
    static let shared = FavoriteManager()

    private let key = "favorite_movie_ids"

    private init() {}

    func saveFavorite(movieId: Int) {
        var ids = getFavorites()
        ids.insert(movieId)
        UserDefaults.standard.set(Array(ids), forKey: key)
    }

    func removeFavorite(movieId: Int) {
        var ids = getFavorites()
        ids.remove(movieId)
        UserDefaults.standard.set(Array(ids), forKey: key)
    }

    func isFavorite(movieId: Int) -> Bool {
        return getFavorites().contains(movieId)
    }

    private func getFavorites() -> Set<Int> {
        let array = UserDefaults.standard.array(forKey: key) as? [Int] ?? []
        return Set(array)
    }
}
