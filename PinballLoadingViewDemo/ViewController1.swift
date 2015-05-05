//
//  ViewController1.swift
//  PinballLoadingViewDemo
//
//  Created by kino on 15/5/5.
//
//

import UIKit

class ViewController1: UIViewController {

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
        loadingView.backColor = UIColor.whiteColor()
        loadingView.showInWindow()

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64( UInt64(5.0) * NSEC_PER_SEC)) , dispatch_get_main_queue(),
            { [weak self] () -> Void in
                loadingView.stopAnimateAndDismiss()
                self?.navigationController?.popViewControllerAnimated(true)
            })
    }

}
