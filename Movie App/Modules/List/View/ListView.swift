//
//  ListView.swift
//  Movie App
//
//  Created by Rangga Djatikusuma Lukman on 16/04/20.
//  Copyright © 2020 Lukman Solution. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class ListView: UITableViewController {
    
    var type: String? = nil
    let cellIdentifier: String = "ListCell"
    
    private var movies = [Movie]()
    private var tvshows = [Tvshow]()
    
    let viewModel = ListViewModel()
    let disposeBag = DisposeBag()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: self.cellIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 191
        
        if type == "movie" {
            viewModel.getMovies()
        }else{
            viewModel.getTvShows()
        }
        
        subscribeObserver()
    }
    
    func subscribeObserver() {
        viewModel.movies
            .asObserver()
            .subscribe(onNext : { (data) in
                self.movies = data
            })
            .disposed(by: disposeBag)
        
        viewModel.tvshows
            .asObserver()
            .subscribe(onNext : { (data) in
                self.tvshows = data
            })
            .disposed(by: disposeBag)
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if type == "movie" {
            return movies.count
        }
        
        return tvshows.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? ListCell else{
            fatalError("\(self.cellIdentifier) not found cell identifier")
        }
        
        if type == "movie" {
            let movie = movies[indexPath.row]
            cell.title.text = movie.title
            cell.poster.image = movie.poster_path
            cell.desc.text = movie.description
            cell.releaseDate.text = DateUtils.humanDate(movie.release_date)
        }else{
            let tv = tvshows[indexPath.row]
            cell.title.text = tv.name
            cell.poster.image = tv.poster_path
            cell.desc.text = tv.description
            cell.releaseDate.text = DateUtils.humanDate(tv.first_air_date)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if type == "movie" {
            let vc = DetailView(nibName: "DetailView", bundle: nil)
            vc.type = "movie"
            vc.movie = movies[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = DetailView(nibName: "DetailView", bundle: nil)
            vc.type = "tvshow"
            vc.tvshow = tvshows[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
