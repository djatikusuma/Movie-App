//
//  HomeViewModel.swift
//  Movie App
//
//  Created by Rangga Djatikusuma Lukman on 15/04/20.
//  Copyright © 2020 Lukman Solution. All rights reserved.
//

import Foundation
import RxSwift

class HomeViewModel {
    
    public let movies: BehaviorSubject<[Movie]> = BehaviorSubject(value: [])
    public let tvshows: BehaviorSubject<[Tvshow]> = BehaviorSubject(value: [])
    public let banners: BehaviorSubject<[UIImage]> = BehaviorSubject(value: [])
    
    func getBanners() {
        let data = DummyData.banners
        banners.onNext(data)
    }
    
    func getMovies() {
        let data = DummyData.movies
        movies.onNext(data)
    }
    
    func getTvShows() {
        let data = DummyData.tvshows
        tvshows.onNext(data)
    }
}
