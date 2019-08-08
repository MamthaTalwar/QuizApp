//
//  VideoTableViewCell.swift
//  Asignment01
//
//  Created by Mamatha S on 05/08/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var webView: UIWebView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
