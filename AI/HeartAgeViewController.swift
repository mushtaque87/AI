//
//  HeartAgeViewController.swift
//  AI
//
//  Created by Philips on 21/08/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

class HeartAgeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red:52.0/255.0 , green: 73.0/255.0, blue:94.0/255.0, alpha: 1.0)
        self.tableView.registerCellNib(DataTableViewCell.self)
        self.tableView.delegate = self
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

extension HeartAgeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return 50
         return DataTableViewCell.height()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let subContentsVC = storyboard.instantiateViewController(withIdentifier: "VideoPlayerScreen") as! VideoPlayerViewController
//        subContentsVC.vidObj = mainContens[indexPath.row];
     //   self.navigationController?.pushViewController(subContentsVC, animated: true)
    }
}

extension HeartAgeViewController : UITableViewDataSource {
     public func numberOfSections(in tableView: UITableView) -> Int // Default is 1 if not implemented
     {
        return 5
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if(section == 0){
        return "Jobs"
        }
        if(section == 1)
        {
        return "Food"
        }
        if(section == 2)
        {
            return "Relationship"
        }
        if(section == 3)
        {
            return "Exercise"
        }
        return "Health"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: DataTableViewCell.identifier) as! DataTableViewCell
        cell.indexPath = indexPath
        
       // let cellIdentifier = "CellComment"
      //  let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as UITableViewCell?

        
      //  cell.delegate = self
      //  let vid : VideoObject = mainContens[indexPath.row]
        // let data = DataTableViewCellData(imageUrl: vid.imageURL as String, text: vid.title as String)
       // let data = DataTableViewCellData(imageUrl: ""  as String , text: "Title" as String, vidobj: nil as VideoObject)
        
       // cell.setData(data)
        
        //cell.shareButton.addTarget(self, action: #selector(share(sender:)), for: .touchUpInside)
        //cell.shareButton.tag = indexPath.row
       // cell?.textLabel?.text = "Title"
        cell.dataText.text = "Title"
        return cell
    }
}


