//
//  AddingViewController.swift
//  Instyy
//
//  Created by Clayton Petty on 3/27/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class NewPostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var captionField: UITextField!
//    @IBOutlet weak var selectView: SelectView!
    @IBOutlet weak var selectView: UIView!
    var finalImage: UIImage!
    
    
    

    
    @IBAction func onSubmit(sender: AnyObject) {
        
        Post.postUserImage(finalImage, withCaption: captionField.text) { (success:Bool, error:NSError?) -> Void in
            if success {
                print("image saved")
                self.navigationController?.popViewControllerAnimated(true)
            }
            else{
                print(error?.localizedDescription)
            }
            
        }
    }
    
    
    func tapped(sender:UITapGestureRecognizer){
        print("Tapped")
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        _ = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        finalImage = resize(editedImage, newSize: selectView.frame.size)
        selectView.backgroundColor = UIColor(patternImage: finalImage)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target: self, action: "tapped:")
        selectView.addGestureRecognizer(gesture)
        // Do any additional setup after loading the view.
    }
    
    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */


}
