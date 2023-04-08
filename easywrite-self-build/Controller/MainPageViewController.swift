//
//  MainPageViewController.swift
//  easywrite-self-build
//
//  Created by Vighnesh Pradhan on 06/04/23.
//

import UIKit
import SafariServices

class MainPageViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // Action for blog button to open external link
    @IBAction func blogLinkButton(_ sender: UIButton!) {
        if let url = URL(string: "https://www.medium.com") {
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
        }

    }
    
    // Action for camera button to open camera
    @IBAction func cameraButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    // Function to handle the captured image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if info[UIImagePickerController.InfoKey.originalImage] is UIImage {
            // Do something with the captured image
        }
        dismiss(animated: true, completion: nil)
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
