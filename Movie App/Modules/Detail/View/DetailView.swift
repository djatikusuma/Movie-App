//
//  DetailView.swift
//  Movie App
//
//  Created by Rangga Djatikusuma Lukman on 16/04/20.
//  Copyright © 2020 Lukman Solution. All rights reserved.
//

import UIKit

class DetailView: UIViewController {
    @IBOutlet weak var banner: UIImageView!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var textDescription: UITextView!
    
    var type: String? = nil
    var movie: Movie? = nil
    var tvshow: Tvshow? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        banner.image = (type=="movie") ? movie?.poster_path : tvshow?.poster_path
        poster.image = (type=="movie") ? movie?.poster_path : tvshow?.poster_path
        titleName.text = (type=="movie") ? movie?.title : tvshow?.name
        textDescription.text = (type=="movie") ? movie?.description : tvshow?.description
    }


}
