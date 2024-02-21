//
//  ViewController.swift
//  MVC_Todo
//
//  Created by 김동율 on 2/19/24.
//

import UIKit

class ListVC: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    var list: [TestModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callApi()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func callApi() {
        D_Network.shared.fetchDataFromAPI { [weak self] (items, error) in
            guard let self = self else { return }

            if let error = error {
                print("Error: \(error)")
            } else if let items = items {
                
                 
                
                let encoder = JSONEncoder()

                /// encoded는 Data형
                if let encoded = try? encoder.encode(items) {
                    //UserDefaults.standard.setValue(encoded, forKey: "person")
                    UserDefaultsManager.set(encoded, forKey: UserDefaultsManager.keyArrayList)
                }
                
                if let savedData = UserDefaults.standard.object(forKey: UserDefaultsManager.keyArrayList) as? Data {
                    let decoder = JSONDecoder()
                    if let savedObject = try? decoder.decode([TestModel].self, from: savedData) {
                        print(savedObject)
                        list = savedObject
                    }
                }
                
                
                listTableView.reloadData()
            }
            
           
            
            
            if UserDefaults.standard.object(forKey: UserDefaultsManager.keyArrayList) != nil{
                        if let data = UserDefaults.standard.value(forKey: UserDefaultsManager.keyArrayList) as? Data{
//                            let decoderUserInfo = try? PropertyListDecoder().decode(userInfo.self, from: data)
//                            self.user = decoderUserInfo
                            print(data)
                        }
                    }
        }
    }
    
    private func setupTableView() {
        listTableView.register(UINib(nibName: "ListTableViewCell", bundle: Bundle(for: type(of: self))), forCellReuseIdentifier: "listcell")
        listTableView.delegate = self
        listTableView.dataSource = self
    }



}

extension ListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "listcell", for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        print("Event")
        cell.setInfo(info: list[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 400
    }
    
    
}

