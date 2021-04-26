//
//  CategorizesVC.swift
//  FlickImages
//
//  Created by Hoang Pham on 22.4.2021.
//

import UIKit

final class CategoriesVC: FIBaseTableVC {

    private var categoriesViewModel = CategoriesViewModel()
    private var dataSource: CategoriesDataSource<CategoriesViewModel>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        dataSource = CategoriesDataSource(categories: categoriesViewModel)
        tableView.dataSource = dataSource
        navigationItem.title = categoriesViewModel.getTitle()
    }
}

// MARK: - TableView Delegate

extension CategoriesVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categoriesViewModel.getItem(byPosition: indexPath.row) as! CategoryChildsProtocol
        
        let destVC = CategoryChildsVC(category: category)
        
        navigationController?.pushViewController(destVC, animated: true)
    }
    
}
