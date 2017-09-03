//
//  ThridTab_ViewController.swift
//  AI
//
//  Created by Philips on 17/08/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

class ThridTab_ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
  
    var mainContent: [DataObject] = [DataObject]();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red:52.0/255.0 , green: 73.0/255.0, blue:94.0/255.0, alpha: 1.0)
        self.tableView.registerCellNib(DataTableViewCell.self)
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
        relationslist()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func relationslist()
    {
        //   if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        if let path = Bundle.main.path(forResource: "relation_json", ofType:"txt") {
            //  let path = dir.appendingPathComponent("jobs_json.txt")
            
            let file: FileHandle? = FileHandle(forReadingAtPath: path)
            let data = file?.readDataToEndOfFile()
            
            
            do {
                //  let text2 = try String(contentsOf: path, encoding: String.Encoding.utf8)
                let json: NSDictionary = try! JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
                print(json)
                
                let videoArray:NSArray = json.object(forKey: "relation") as! NSArray
                print(videoArray)
                for count in 0..<videoArray.count
                {
                    let data = DataObject()
                    let jobsDict: NSDictionary = videoArray.object(at:count )  as! NSDictionary;
                    data.title = jobsDict.object(forKey: "Title") as! NSString!
                    data.company =  jobsDict.object(forKey: "Company") as! NSString!
                    data.imageURL =  jobsDict.object(forKey: "Logo") as! NSString!
                    self.mainContent.append(data)
                    
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



extension ThridTab_ViewController : UITableViewDelegate {
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

extension ThridTab_ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.mainContent.count
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
        //cell.dataText.text = "Title"
        
        let data:DataObject = self.mainContent[indexPath.row]
        cell.dataText.text =  data.title as String
        cell.detailText.text = data.company as String
        cell.dataImage.image = UIImage(named:(data.imageURL!) as String)
        
        return cell
    }
}
