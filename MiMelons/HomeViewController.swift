//
//  HomeViewController.swift
//  MiMelons
//
//  Created by Sophie Qin on 2019-09-14.
//  Copyright © 2019 Sophie Qin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private let dateArray = ["12/08/19", "06/07/19", "19/06/19", "03/06/19", "13/05/19"]
    private let imageArray = [UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!, UIImage(named: "1")!, UIImage(named: "3")!]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.backgroundColor()
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "homeTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = Theme.backgroundColor()
        
        titleLabel.textColor = Theme.textColor()
        titleLabel.text = "Welcome back ~"
        daysLabel.textColor = Theme.textColor()
        daysLabel.text = "DAYS LATE"

    }

}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 73
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = ThemeButtonView(frame: CGRect(x: 8, y: 0, width: UIScreen.main.bounds.width, height: 65), title: "Start Checkup")
        view.onTap = {
            let vc: CameraViewController = CameraViewController()
            vc.onTap = {
                self.dismiss(animated: true, completion: nil)
            }
            self.present(vc, animated: true, completion: nil)
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "homeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.dateLabel.text = dateArray[indexPath.item]
        let imageView = UIImageView()
        let image = imageArray[indexPath.item]
        imageView.image = image
        cell.symptomImageView = imageView
        cell.selectionStyle = .none
        return cell
    }
}
