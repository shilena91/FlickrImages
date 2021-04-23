//
//  CategorizesVC.swift
//  FlickImages
//
//  Created by Hoang Pham on 22.4.2021.
//

import UIKit

class CategoriesVC: FIBaseTableVC {

    private var categoriesViewModel = CategoriesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = categoriesViewModel.getTitle()
    }
}

// MARK: - TableView Delegate and DataSource

extension CategoriesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesViewModel.numberOfCategorizes()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.reuseId, for: indexPath) as! CategoryCell
        
        let category = categoriesViewModel.getCategoryType(byPosition: indexPath.row)
        
        cell.set(categorizeName: category.title, accessoryType: .disclosureIndicator)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categoriesViewModel.getCategoryType(byPosition: indexPath.row) as! CategoryTypesProtocol
        
        let destVC = CategoryTypesVC(category: category)
        
        navigationController?.pushViewController(destVC, animated: true)
    }
    
}
