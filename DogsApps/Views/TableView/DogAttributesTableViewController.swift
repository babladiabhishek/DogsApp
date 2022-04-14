//
//  DogAttributesTableViewController.swift
//  DogsApps
//
//  Created by Abhishek babladi on 2022-03-30.
//

import UIKit

class DogAttributesTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private  var viewModel = AttributesViewModel()
    var dogApiData:Dogs?
    var id:IndexPath = [0,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAttributesViewModel()
        setupView()
    }
    
    
    
    func initAttributesViewModel() {
        viewModel.fetchDogAttributes(dogsData:dogApiData ?? [])
    }
    
    func setupView() {
        self.navigationItem.title = "Attributes"
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
}

extension DogAttributesTableViewController:UITableViewDelegate,UITableViewDataSource {
    
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //         Configure the cell...
            let identifier = Constants.ReuseIdentifiers.tableViewIdentifier
            let attributesCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
            if let cell = attributesCell as? AttributesTableViewCell  {
            let cellVM = viewModel.getAttributesCellViewModel(at: id)
            cell.updateLabel(cellViewModel: cellVM)
            return cell
        } else {return fatalError("some error") as! UITableViewCell}
    }
}
