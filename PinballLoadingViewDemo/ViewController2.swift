//
//  ViewController2.swift
//  PinballLoadingViewDemo
//
//  Created by kino on 15/5/5.
//
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let loadingView = PinballLoadingView()
        
        loadingView.configureBackView = { (frame:CGRect) -> UIView in
            
            let contentView = UIView(frame: frame)
            let imageView = UIImageView(image: UIImage(named: "loadingBack"))
            imageView.frame = contentView.bounds
            let  blurLayer = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light))
            blurLayer.frame = contentView.bounds

            contentView.addSubview(imageView)
            contentView.addSubview(blurLayer)
            
            return contentView
        }
        
        loadingView.showInView(self.view)
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64( UInt64(5.0) * NSEC_PER_SEC)) , dispatch_get_main_queue(),
            { [weak self] () -> Void in
                loadingView.stopAnimateAndDismiss()
                self?.navigationController?.popViewControllerAnimated(true)
            })
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
