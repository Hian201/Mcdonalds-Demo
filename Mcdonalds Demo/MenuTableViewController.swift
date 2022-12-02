//
//  MenuTableViewController.swift
//  Mcdonalds Demo
//
//  Created by So í-hian on 2022/11/20.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    var allMenu = [Record]()
    //var testMeal = [[Record]]()
    var testMeal = [[Record](),[Record]()]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMealData()
    
        //確保cell高度可自動調節
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    // MARK: - Fetch Data
    func fetchMealData() {
        if let url = URL(string: "https://api.airtable.com/v0/appKmSynalVzk6Mhm/meal") {
            var request = URLRequest(url: url)
            request.httpMethod = "get"
            request.setValue("Bearer keyd3CHUC8CpdETAR", forHTTPHeaderField: "Authorization")
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data {
                    do {
                        let decoder = JSONDecoder()
                        let menu = try decoder.decode(MealData.self, from: data)
                        DispatchQueue.main.async {
                            
                            self.allMenu = menu.records
                            //print(self.allMenu)
                            
                            for food in self.allMenu {
                                
                                switch food.fields.category {
                                case "早餐":
                                    self.testMeal[0].append(food)
//                                    var breakfast = [Record]()
//                                    breakfast.append(food)
//                                    self.testMeal[0].append(contentsOf: breakfast)
                                case "超值全餐":
                                    self.testMeal[1].append(food)
//                                    var entree = [Record]()
//                                    entree.append(food)
//                                    self.testMeal[1].append(contentsOf: entree)
                                default:
                                    break
                                }
                                
                            }
                            print("all ==> \(self.testMeal[0][0])")
                            self.tableView.reloadData()
                        }
                    } catch {
                        print(error)
                    }
                } else {
                    print("no data")
                }
            }.resume()
        }
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //return meals.count
        //return meals2.count
        return testMeal.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return meals[section].items.count
        //return meals2[section].count
        return testMeal[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //return meals[section].name
        
        //#1
        //return "早餐"
//        if !testMeal[0].isEmpty {
//            return testMeal[0][0].fields.category
//        } else {
//            return ""
//        }
        
        //#2
//        if !testMeal[0].isEmpty { // 先檢查陣列不為空再載入值
//            switch section {
//            case 0:
//                return testMeal[0][0].fields.category
//            case 1:
//                return testMeal[1][0].fields.category
//            default:
//                return ""
//            }
//        } else {
//            return ""
//        }
        
        //#3
        guard !testMeal[0].isEmpty else { return "" }
        switch section {
        case 0:
            return testMeal[0][0].fields.category
        case 1:
            return testMeal[1][0].fields.category
        default:
            return ""
        }
        
    }


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
             
        // Configure the cell...
        //cell.cellUpdate(meals[indexPath.section].items[indexPath.row])
        //cell.cellUpdate(meals2[indexPath.section][indexPath.row])
        let cellData = testMeal[indexPath.section][indexPath.row].fields
        //print(testMeal[indexPath.section][indexPath.row])
        cell.cellUpdate(cellData)
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "orderSegue" {
            guard let model = sender as? MenuItem else {return}
            
            let detailVC: OrderViewController = segue.destination as! OrderViewController
            
            detailVC.orderDetail = model
        }
    }
    

}
