//
//  VideoView.swift
//  Asignment01
//
//  Created by Mamatha S on 01/08/19.
//  Copyright © 2019 Mamatha S. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class VideoView: UIView {
    
    /// This function is used to play the video on clicking on playVideo Button
    @IBAction func playVideo(_ sender: Any) {
        guard let url = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4") else {
            return
        }
        let player = AVPlayer(url: url)
        let controller = AVPlayerViewController()
        controller.player = player
        //a.present(controller, animated: true) {
            player.play()
        }
}


