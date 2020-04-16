//
//  ViewController.swift
//  Movie App
//
//  Created by Rangga Djatikusuma Lukman on 14/04/20.
//  Copyright © 2020 Lukman Solution. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class HomeView: UIViewController {
    @IBOutlet weak var collectionSlide: UICollectionView!
    @IBOutlet weak var collectionMovie: UICollectionView!
    @IBOutlet weak var collectionTvshow: UICollectionView!
    
    private var movies = [Movie]()
    private var tvshows = [Tvshow]()
    private var banners = [UIImage]()
    
    let viewModel = HomeViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getMovies()
        viewModel.getTvShows()
        viewModel.getBanners()
        
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
        
        viewModel.banners
            .asObserver()
            .subscribe(onNext : { (data) in
                self.banners = data
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func moveToListMovie(_ sender: Any) {
        let vc = ListView(nibName: "ListView", bundle: nil)
        vc.type = "movie"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func moveToListTvshow(_ sender: Any) {
        let vc = ListView(nibName: "ListView", bundle: nil)
        vc.type = "tvshow"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

extension HomeView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case collectionMovie:
            return movies.count
        case collectionTvshow:
            return tvshows.count
        default:
            return banners.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            case collectionMovie:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCell
                
                let movie = movies[indexPath.row]
                cell.name.text = movie.title
                cell.image.image = movie.poster_path
                
                return cell
            case collectionTvshow:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tvshowCell", for: indexPath) as! TvshowsCell
                
                let tvshow = tvshows[indexPath.row]
                cell.name.text = tvshow.name
                cell.image.image = tvshow.poster_path
                
                return cell
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "slideCell", for: indexPath) as! SlideCell
                
                cell.imageSlide.image = banners[indexPath.row]
                
                return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        switch collectionView {
            case collectionMovie: return CGSize(width: 160, height: 240)
            case collectionTvshow: return CGSize(width: 160, height: 240)
            default: return CGSize(width: 342, height: 100)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView {
            case collectionMovie:
                let vc = DetailView(nibName: "DetailView", bundle: nil)
                vc.type = "movie"
                vc.movie = movies[indexPath.row]
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case collectionTvshow:
                let vc = DetailView(nibName: "DetailView", bundle: nil)
                vc.type = "tvshow"
                vc.tvshow = tvshows[indexPath.row]
                self.navigationController?.pushViewController(vc, animated: true)
                break
            default: return
        }
            
    }
    
    
    
}

