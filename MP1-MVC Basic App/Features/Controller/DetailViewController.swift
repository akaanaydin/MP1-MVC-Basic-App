//
//  DetailViewController.swift
//  MP1-MVC Basic App
//
//  Created by Arslan Kaan AYDIN on 2.05.2022.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var lblMovieOverview: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var lblMovieReleaseDate: UILabel!
    
    var movieName = String()
    var movieOverview = String()
    var movieImagePath = String()
    var movieReleaseDate = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        Bundle.main.loadNibNamed("DetailViewController", owner: self, options: nil)
        lblMovieName?.text = movieName
        lblMovieOverview?.text = movieOverview
        lblMovieReleaseDate?.text = movieReleaseDate
        movieImage.kf.setImage(with: URL(string: Constant.NetworkCostant.IMAGE_BASE_URL + movieImagePath))
    }


}
