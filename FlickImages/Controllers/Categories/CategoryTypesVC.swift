//
//  CategorizeTypeVC.swift
//  FlickImages
//
//  Created by Hoang Pham on 22.4.2021.
//

import UIKit

class CategoryTypesVC: FIBaseTableVC {

    private var categoryTypesViewModel: CategoryTypesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    init(category: CategoryTypesProtocol) {
        super.init(nibName: nil, bundle: nil)
        
        navigationItem.title = category.title
        self.categoryTypesViewModel = CategoryTypesViewModel(categoryTypes: category.types)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - TableView Delegate and DataSource

extension CategoryTypesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryTypesViewModel?.numberOfCategoryTypes() ?? 0
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.reuseId, for: indexPath) as! CategoryCell
        
        if let categoryType = categoryTypesViewModel?.getCategoryType(byPosition: indexPath.row) {
            cell.set(categorizeName: categoryType.title, accessoryType: .disclosureIndicator)
        }
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let categoryType = categoryTypesViewModel?.getCategoryType(byPosition: indexPath.row) as? KeywordsProtocol {
            
            let destVC = CategoryKeywordsVC(keywords: categoryType)
            navigationController?.pushViewController(destVC, animated: true)
        }
    }
    
}
