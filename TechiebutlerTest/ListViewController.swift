//
//  ListViewController.swift
//  TechiebutlerTest
//
//  Created by Rashida on 1/05/24.
//

import UIKit

class ListViewController: UIViewController {

    
    @IBOutlet weak var listTblView: UITableView!
    @IBOutlet weak var loaderSpin: UIActivityIndicatorView!
    
    
    var allItems = [[String:Any]]()
    var displayedItems = [[String:Any]]()
    
    let itemsPerPage = 10
    var currentPage = 1

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loaderSpin.isHidden = false
        self.getAllItemData()
        
        
        // Do any additional setup after loading the view.
        
        self.listTblView.register(UINib(nibName: "ItemTblCell", bundle: nil), forCellReuseIdentifier: "ItemTblCell")
        self.listTblView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 24.0, right: 0.0)
        self.listTblView.estimatedRowHeight = UITableView.automaticDimension
        self.listTblView.rowHeight = UITableView.automaticDimension
        
    }
    
    
}


extension ListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.displayedItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTblCell") as! ItemTblCell
        let obj = self.displayedItems[indexPath.row]
        cell.setDataOnCell(obj)
            return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Load next page when reaching the end of currently displayed items
        if indexPath.row == displayedItems.count - 1 && displayedItems.count < allItems.count {
            loadNextPage()
        }
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let vc = ItemDetailVC.getReferenceFromStoryBoard("Main")
        let obj = self.displayedItems[indexPath.row]
        vc.pasItem = obj
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}



extension ListViewController {
    
    func getAllItemData(){
        
        let url = "https://jsonplaceholder.typicode.com/posts"

        APIClient.callGetapi(url: url) { response, status in
            
            if status == 200 {
                
                OperationQueue.main.addOperation {
                    
                    if let data = response as? [[String:Any]]{

                        
                        self.allItems.removeAll()
                        
                        if data.count > 0 {
                            
                            
                            for obj in data{
                                    self.allItems.append(obj)
                            }
                            
                            
                            self.loaderSpin.isHidden = true
                            self.listTblView.isHidden = false
                            
                            self.loadNextPage()
                            
                        }else{
                            
                            self.loaderSpin.isHidden = true
                            self.listTblView.isHidden = true
                            
                        }
                    }
                }
                
            }
            else {
                
                OperationQueue.main.addOperation {
                    
                    self.loaderSpin.isHidden = true
                    self.listTblView.isHidden = true
                    
                }
            }
        }
        
    }
    
    func loadNextPage() {
        let startIndex = (currentPage - 1) * itemsPerPage
        let endIndex = min(currentPage * itemsPerPage, allItems.count)
        let newItems = Array(allItems[startIndex..<endIndex])
        self.displayedItems.append(contentsOf: newItems)
        currentPage += 1
        self.listTblView.delegate = self
        self.listTblView.dataSource = self
        self.listTblView.reloadData()
        self.listTblView.reloadData()
        
        DispatchQueue.global(qos: .background).async {
            let startTime = Date()
            for item in newItems {
                self.performHeavyComputation(for: item)
            }
            let endTime = Date()
            let timeDifference = endTime.timeIntervalSince(startTime)
            print("Time taken for heavy computation: \(timeDifference) seconds")
        }

    }

    
    func performHeavyComputation(for item: [String:Any]) {
          for _ in 0..<100000 {
              let _ = sqrt(Double.random(in: 0...100000))
          }
      }
}


