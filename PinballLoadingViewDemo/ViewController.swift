//
//  ViewController.swift
//  PinballLoadingViewDemo
//
//  Created by kino on 15/4/20.
//
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    var loadingView:PinballLoadingView? = nil
    
    var cellContents:Array<Dictionary<String,UIViewController>> = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = viewControllerByName("ViewController1")
        let vc2 = viewControllerByName("ViewController2")
        let vc3 = viewControllerByName("ViewController3")
        cellContents = [["全屏加载页":vc1],["自定义背景":vc2],["自定义渐变色":vc3]]
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.tableFooterView = UIView()
    }
    
    func viewControllerByName(name:String)->UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(name) as! UIViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellContents.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        let dic = cellContents[indexPath.row] as Dictionary<String, UIViewController>
        
        let keyArray = [String](dic.keys)
        cell.textLabel?.text = keyArray[0]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let dic = cellContents[indexPath.row] as Dictionary<String, UIViewController>
        let values = [UIViewController](dic.values)
        
        let controller = values[0] as UIViewController
        let keyArray = [String](dic.keys)
        controller.title = keyArray[0] as String
        self.navigationController?.pushViewController(controller, animated: true)
    }

}

