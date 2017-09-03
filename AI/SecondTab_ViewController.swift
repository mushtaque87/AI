//
//  SecondTab_ViewController.swift
//  AI
//
//  Created by Philips on 17/08/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

class SecondTab_ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
  var mainContens:  [DataObject] = [DataObject] ();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red:52.0/255.0 , green: 73.0/255.0, blue:94.0/255.0, alpha: 1.0)
        self.tableView.registerCellNib(DataTableViewCell.self)
      //  self.tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
        jobslist()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func jobslist()
    {
     //   if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        if let path = Bundle.main.path(forResource: "jobs_json", ofType:"txt") {
          //  let path = dir.appendingPathComponent("jobs_json.txt")
            
            let file: FileHandle? = FileHandle(forReadingAtPath: path)
            let data = file?.readDataToEndOfFile()

        
        do {
          //  let text2 = try String(contentsOf: path, encoding: String.Encoding.utf8)
            let json: NSDictionary = try! JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
            print(json)
            
              let videoArray:NSArray = json.object(forKey: "Jobs") as! NSArray
            print(videoArray)
            for count in 0..<videoArray.count
            {
                let data = DataObject()
                let jobsDict: NSDictionary = videoArray.object(at:count )  as! NSDictionary;
                data.title = jobsDict.object(forKey: "Title") as! NSString!
                data.company =  jobsDict.object(forKey: "Company") as! NSString!
                data.imageURL =  jobsDict.object(forKey: "Logo") as! NSString!
                self.mainContens.append(data)
            }
        }
        catch {/* error handling here */}
        }
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

extension SecondTab_ViewController : UITableViewDelegate {
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

extension SecondTab_ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return self.mainContens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: DataTableViewCell.identifier) as! DataTableViewCell
      //  let cellIdentifier = "Jobs"
     //   let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as UITableViewCell?
        
        cell.indexPath = indexPath
        //cell.backgroundColor = UIColor.blue
        let data:DataObject = self.mainContens[indexPath.row]
        cell.dataText.text =  data.title as String
        cell.detailText.text = data.company as String
        cell.dataImage.image = UIImage(named:(data.imageURL!) as String)
        //cell.detailTextLabel?.backgroundColor = UIColor.red
    //    cell?.textLabel?.text = data.title! as String
      //  cell?.detailTextLabel?.text =  data.description
        
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
        //cell.dataText.text = data.title! as String
        return cell
    }
}
