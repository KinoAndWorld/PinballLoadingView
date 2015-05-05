//
//  ViewController3.swift
//  PinballLoadingViewDemo
//
//  Created by kino on 15/5/5.
//
//

import UIKit

class ViewController3: UIViewController {

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
        loadingView.backColor = UIColor(red: 0.2, green: 0.6, blue: 0.7, alpha: 1.0)
        loadingView.configureBallInfo = { (index:Int) -> (CGSize, UIColor) in
            return (CGSizeMake(25, 25), UIColor(red: 0.1, green: CGFloat(index+1)*0.1, blue: 0.3, alpha: 0.8))
        }
        loadingView.showInView(self.view)
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64( UInt64(5.0) * NSEC_PER_SEC)) , dispatch_get_main_queue(),
            { [weak self] () -> Void in
                loadingView.stopAnimateAndDismiss()
                self?.navigationController?.popViewControllerAnimated(true)
            })
    }
}
