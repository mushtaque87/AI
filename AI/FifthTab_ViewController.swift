//
//  FifthTab_ViewController.swift
//  AI
//
//  Created by Philips on 23/08/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

class FifthTab_ViewController: UIViewController {
@IBOutlet weak var tableView: UITableView!
      var mainContens:  [DataObject] = [DataObject] ();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red:52.0/255.0 , green: 73.0/255.0, blue:94.0/255.0, alpha: 1.0)
        //self.tableView.registerCellNib(Calendar_TableViewCell.self)
        self.tableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
        relaxList()
    }
    
    func relaxList()
    {
        
        if let path = Bundle.main.path(forResource: "relax_json", ofType:"txt") {
            //  let path = dir.appendingPathComponent("jobs_json.txt")
            
            let file: FileHandle? = FileHandle(forReadingAtPath: path)
            let data = file?.readDataToEndOfFile()
            
            
            do {
                //  let text2 = try String(contentsOf: path, encoding: String.Encoding.utf8)
                let json: NSDictionary = try! JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
                print(json)
                
                let videoArray:NSArray = json.object(forKey: "relax") as! NSArray
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


extension FifthTab_ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return 50
        if(indexPath.section == 0)
        {
            return 90
        }
        if(indexPath.section == 1)
        {
            return DataTableViewCell.height()

        }
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //        let subContentsVC = storyboard.instantiateViewController(withIdentifier: "VideoPlayerScreen") as! VideoPlayerViewController
        //        subContentsVC.vidObj = mainContens[indexPath.row];
        //   self.navigationController?.pushViewController(subContentsVC, animated: true)
    }
    
}

extension FifthTab_ViewController : UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int // Default is 1 if not implemented
    {
        return 2
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if(section == 0){
            return "Calendar"
        }
        if(section == 1)
        {
            return "Recommendations"
        }
        return "Recommendations"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     if(section == 0){
        return 15
        }
        if(section == 1)
        {
            return self.mainContens.count
        }
        return 5
    }
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     if(indexPath.section == 0)
     {
    let cell = tableView.dequeueReusableCell( withIdentifier: "cell", for: indexPath) as! Calendar_TableViewCell
    print(cell.timebar.time)
     cell.dateText.text = String(format:"August \(indexPath.row + 1)")
    cell.timeText.text = String(format:"\(String(describing: Int(cell.timebar.time/12.5))) Hrs")
    return cell
    }
   else
    {
        self.tableView.registerCellNib(DataTableViewCell.self)
        let cell = self.tableView.dequeueReusableCell(withIdentifier: DataTableViewCell.identifier) as! DataTableViewCell
        //cell.dataText.text = "Data"
        let data:DataObject = self.mainContens[indexPath.row]
        cell.dataText.text =  data.title as String
        cell.detailText.text = data.company as String
        cell.dataImage.image = UIImage(named:(data.imageURL!) as String)
        return cell
    }
    
    }
    
}


  
