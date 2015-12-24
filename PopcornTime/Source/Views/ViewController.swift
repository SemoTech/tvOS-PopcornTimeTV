//
//  ViewController.swift
//  PopcornTime
//
//  Created by Pedro Pinera Buendia on 24/12/15.
//  Copyright © 2015 com.PPinera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        PTTorrentStreamer.sharedStreamer().startStreamingFromFileOrMagnetLink("magnet:?xt=urn:btih:FFBB53E265BFAC41E293F9C13C6C523BC28CEB8B", progress: { (status) -> Void in
            
            print("Status: \(status)")
            
        }, readyToPlay: { (url) -> Void in
            print("Ready to play \(url)")
        }) { (error) -> Void in
            print("Error: \(error)")
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

