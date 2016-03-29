//
//  Post.swift
//  Instyy
//
//  Created by Clayton Petty on 3/27/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse

class Post: NSObject {

    class func postUserImage(image: UIImage?, withCaption caption: String?, withCompletion completion: PFBooleanResultBlock?) {
        let post = PFObject(className: "Post")
        
        post["caption"] = caption
        post["likesCount"] = 1
        post["commentsCount"] = 1
        post["author"] = PFUser.currentUser() // Pointer column type that points to PFUser
        post["media"] = getPFFileFromImage(image)

        post.saveInBackgroundWithBlock(completion)
    }
    
    /**
     Method to convert UIImage to PFFile
     
     - parameter image: Image that the user wants to upload to parse
     
     - returns: PFFile for the the data in the image
     */
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        // check if image is not nil
        if let image = image {
            // get image data and check if that is not nil
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }

}
