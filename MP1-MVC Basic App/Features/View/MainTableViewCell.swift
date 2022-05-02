//
//  MainTableViewCell.swift
//  MP1-MVC Basic App
//
//  Created by Arslan Kaan AYDIN on 2.05.2022.
//

import UIKit
import Kingfisher

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imageViewer: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func saveModel(model: Result) {
        let imageURL = Constant.NetworkCostant.IMAGE_BASE_URL + model.poster_path
        lblTitle.text = model.title
        imageViewer.kf.setImage(with: URL(string: Constant.NetworkCostant.IMAGE_BASE_URL + model.poster_path))
        print(imageURL)
    }
    
}
