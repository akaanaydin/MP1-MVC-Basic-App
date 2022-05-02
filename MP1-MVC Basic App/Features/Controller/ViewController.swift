//
//  ViewController.swift
//  MP1-MVC Basic App
//
//  Created by Arslan Kaan AYDIN on 1.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var service = NetworkService()
    var results = [Result]()
    var chosenMovieName = ""
    var chosenMovieOverview = ""
    var chosenMovieImage = ""
    var chosenMovieReleaseDate = ""
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 44
        let nib = UINib(nibName: String(describing: MainTableViewCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: MainTableViewCell.self))
        tableView.rowHeight = 200
        service.fetchAllDatas {
            data in
            self.results = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MainTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: MainTableViewCell.self)) as? MainTableViewCell else {
            return UITableViewCell()
        }
        cell.saveModel(model: results[indexPath.row])
        return cell
    }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            chosenMovieName = results[indexPath.row].title
            chosenMovieOverview = results[indexPath.row].overview
            chosenMovieImage = results[indexPath.row].poster_path
            chosenMovieReleaseDate = results[indexPath.row].release_date
            performSegue(withIdentifier: "toDetailVC", sender: nil)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toDetailVC" {
                let destinationVC = segue.destination as! DetailViewController
                destinationVC.movieName = chosenMovieName
                destinationVC.movieOverview = chosenMovieOverview
                destinationVC.movieImagePath = chosenMovieImage
                destinationVC.movieReleaseDate = chosenMovieReleaseDate
                
            }
        }
}
