//
//  CategorizeTypeVC.swift
//  FlickImages
//
//  Created by Hoang Pham on 22.4.2021.
//

import UIKit

final class CategoryTypesVC: FIBaseTableVC {

    private var categoryTypesViewModel: CategoryTypesViewModel?
    private var dataSource: CategoriesDataSource<CategoryTypesViewModel>?
    
    init(category: CategoryTypesProtocol) {
        super.init(nibName: nil, bundle: nil)
        
        self.categoryTypesViewModel = CategoryTypesViewModel(categoryTypes: category)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = categoryTypesViewModel?.getTitle()
        
        tableView.delegate = self
        dataSource = CategoriesDataSource(categories: categoryTypesViewModel!)
        tableView.dataSource = dataSource
    }
    
}

// MARK: - TableView Delegate

extension CategoryTypesVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let categoryType = categoryTypesViewModel?.getItem(byPosition: indexPath.row) as? KeywordsProtocol {
            
            let destVC = CategoryKeywordsVC(keywords: categoryType)
            navigationController?.pushViewController(destVC, animated: true)
        }
    }
    
}
