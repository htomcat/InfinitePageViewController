//
//  TestViewController.swift
//  InfinitePageViewController
//
//  Created by htomcat on 2018/04/25.
//  Copyright © 2018年 htomcat. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBAction func button(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RootViewController") as! RootViewController
        let view1 = Test1ViewController()
        view1.title = "title1"
        view1.view.backgroundColor = .red
        let view2 = Test2ViewController()
        view2.title = "title2"
        view2.view.backgroundColor = .yellow
        let view3 = Test3ViewController()
        view3.title = "title3"
        view3.view.backgroundColor = .blue
        let view4 = Test4ViewController()
        view4.title = "title4"
        view4.view.backgroundColor = .white
        let view5 = Test5ViewController()
        view5.title = "title5"
        view5.view.backgroundColor = .black
        let sample = [view1, view2, view3, view4, view5]
        vc.setPages(sample)
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
