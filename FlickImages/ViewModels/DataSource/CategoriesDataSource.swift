//
//  CategoriesDataSource.swift
//  FlickImages
//
//  Created by Hoang Pham on 23.4.2021.
//

import UIKit

// Generic dataSource for categories
class CategoriesDataSource<T: CategoriesDataSourceProtocol>: NSObject, UITableViewDataSource {
    
    var categories: T
    
    init(categories: T) {
        self.categories = categories
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.numberOfItems()
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.reuseId, for: indexPath) as! CategoryCell
        
        let category = categories.getItem(byPosition: indexPath.row)
        
        // This part might be improved
        if let category = category as? CategoryProtocol {
            cell.set(categorizeName: category.title, accessoryType: .disclosureIndicator)
        } else if let keyword = category as? String {
            cell.set(categorizeName: keyword, accessoryType: .none)
        }
        
        return cell
    }
    
}
