//
//  TableViewController.swift
//  IRDb_JSONActivity-MRC
//
//  Created by Miranda Ramirez Cospin on 10/20/20.
//

import UIKit

class TableViewController: UITableViewController {

    //Dummy test
    var outerArray = ["First Sect. Name", "Second Sect. Name"]
    var innerArray1 = ["First Thing", "Second Thing", "Third Thing"]
    var innerArray2 = ["First Thing", "Second Thing", "Third Thing", "FOURTH Thing!"]
    
    var mediaModel: MediaDataModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var dataController = DataController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "IRDb"

        // 1
        let nav = self.navigationController?.navigationBar

        // 2
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.init(red: 245/255, green: 196/255, blue: 72/255, alpha: 1)

        // 3
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        imageView.contentMode = .scaleAspectFit

        // 4
        let image = UIImage(named: "irdblogo")
        imageView.image = image

        // 5
        navigationItem.titleView = imageView
        
        // call my dataController and then wait
        dataController.getJSONData(completion: { dataModel in
            self.mediaModel = dataModel
        })
    }
    

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return outerArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0)
        {
            return innerArray1.count
        }
        else if (section == 1)
        {
            return innerArray2.count
        }
        else
        {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return outerArray[section]
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediaCell", for: indexPath)

        var arrayForThisCell = [Any]()
        if (indexPath.section == 0)
        {
            arrayForThisCell = innerArray1
        }
        else if (indexPath.section == 1){
            arrayForThisCell = innerArray2
        }
        
        // Configure the cell...
        cell.textLabel?.text = arrayForThisCell[indexPath.row] as? String
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
