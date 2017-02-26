//
//  ItemDetailsVC.swift
//  ListYourDreams
//
//  Created by Preeti Patel on 25/02/17.
//  Copyright © 2017 Vandan Patel. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var costTextField: UITextField!
    @IBOutlet weak var detailsField: UITextField!
    
    var stores = [Store]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        storePicker.delegate = self
        storePicker.dataSource = self
        
        if let topItem = navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        
//        let store = Store(context: context)
//        store.name = "Best Buy"
//        
//        let store2 = Store(context: context)
//        store2.name = "BMW Dealership"
//        
//        let store3 = Store(context: context)
//        store3.name = "Frys Electronics"
//        
//        let store4 = Store(context: context)
//        store4.name = "Target"
//        
//        let store5 = Store(context: context)
//        store5.name = "Amazon"
//        
//        let store6 = Store(context: context)
//        store6.name = "eBay"
//        
//        ad.saveContext()
        getStores()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //update when selected
    }
    
    func getStores() {
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            stores = try context.fetch(fetchRequest)
            storePicker.reloadAllComponents()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        let item = Item(context: context)
        
        if let title = titleTextField.text {
            item.title = title
        }
        
        if let cost = costTextField.text {
            item.cost = (cost as NSString).doubleValue
        }
        
        if let details = detailsField.text {
            item.details = details
        }
        
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    
    
}
