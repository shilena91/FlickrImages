//
//  CategorizeTypeVC.swift
//  FlickImages
//
//  Created by Hoang Pham on 22.4.2021.
//

import UIKit

final class CategoryChildsVC: FIBaseTableVC {

    private var categoryChildsViewModel: CategoryChildsViewModel?
    private var dataSource: CategoriesDataSource<CategoryChildsViewModel>?
    
    init(category: CategoryChildsProtocol) {
        super.init(nibName: nil, bundle: nil)
        
        self.categoryChildsViewModel = CategoryChildsViewModel(categoryChilds: category)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = categoryChildsViewModel?.getTitle()
        
        tableView.delegate = self
        dataSource = CategoriesDataSource(categories: categoryChildsViewModel!)
        tableView.dataSource = dataSource
    }
    
}

// MARK: - TableView Delegate

extension CategoryChildsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let categoryType = categoryChildsViewModel?.getItem(byPosition: indexPath.row) as? KeywordsProtocol {
            
            let destVC = CategoryKeywordsVC(keywords: categoryType)
            navigationController?.pushViewController(destVC, animated: true)
        }
    }
    
}
