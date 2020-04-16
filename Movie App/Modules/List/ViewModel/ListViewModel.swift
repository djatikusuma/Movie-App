//
//  ListViewModel.swift
//  Movie App
//
//  Created by Rangga Djatikusuma Lukman on 16/04/20.
//  Copyright © 2020 Lukman Solution. All rights reserved.
//

import Foundation
import RxSwift

class ListViewModel {
    
    public let movies: BehaviorSubject<[Movie]> = BehaviorSubject(value: [])
    public let tvshows: BehaviorSubject<[Tvshow]> = BehaviorSubject(value: [])
    
    func getMovies() {
        let data = DummyData.movies
        movies.onNext(data)
    }
    
    func getTvShows() {
        let data = DummyData.tvshows
        tvshows.onNext(data)
    }
}
