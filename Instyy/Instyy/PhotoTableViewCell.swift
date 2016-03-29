//
//  PhotoTableViewCell.swift
//  Instyy
//
//  Created by Clayton Petty on 3/27/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import ParseUI

class PhotoTableViewCell: PFTableViewCell {

//    @IBOutlet weak var photoImageView: PFImageView!
    
    @IBOutlet weak var photoImageView: PFImageView!
//    @IBOutlet weak var photoImageView: PFImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    var instagramPost: PFObject! {
        didSet {
//            prin t(instagramPost["caption"])
//            let newCaption = instagramPost["caption"] as! String
            self.photoImageView.file = instagramPost["media"] as? PFFile
            self.photoImageView.loadInBackground()
            self.captionLabel.text = instagramPost["caption"] as! String
            
            
            
//            self.captionLabel.text = newCaption

            //            instagramPost["media"]?.getDataInBackgroundWithBlock({ (data: NSData?, error: NSError?) -> Void in
            //                if error == nil {
            //                    self.photoImageView.image = UIImage(data: data!)!
            //                }
            //                else {
            //                    print("error")
            //                }
            //            })
            //
            ////            if let file = post.imageFile {
            ////                file.getDataInBackgroundWithBlock({ (data: NSData?, error: NSError?) -> Void in
            ////                    if error == nil {
            ////                        self.postImage.image = UIImage(data: data!)!
            ////                        print("Set the image")
            ////                    } else {
            ////                        print(error?.localizedDescription)
            ////                    }
            ////                })
            ////            }
        }
    }

}
