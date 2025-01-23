//
//  DetailViewController.swift
//  PhotoSearch
//
//  Created by 이민영 on 1/23/25.
//

import UIKit

class DetailViewController: UIViewController {
    var id: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
        print(id ?? "없음")
        
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
