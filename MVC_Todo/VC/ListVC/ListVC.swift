//
//  ViewController.swift
//  MVC_Todo
//
//  Created by 김동율 on 2/19/24.
//

import UIKit

class ListVC: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var countLabel: UILabel!
    
    var list: [TestModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkCallApi()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let savedData = UserDefaults.standard.object(forKey: UserDefaultsManager.keyApiList) as? Data {
            let decoded = CodableManager.operateDecode(savedData)
            list = decoded
        }
        
        countLabel.text = String(list.count)
        listTableView.reloadData()
    }
    
    private func checkCallApi() {
        if let savedData = UserDefaults.standard.object(forKey: UserDefaultsManager.keyApiList) as? Data {
        } else {
            callApi()
        }
    }
    
    private func callApi() {
        D_Network.shared.fetchDataFromAPI { [weak self] (items, error) in
            guard let self = self else { return }
            
            if let error = error {
                
            } else if let items = items {
                list = items
                countLabel.text = String(list.count)
                let encoded = CodableManager.operateEncode(items)
                UserDefaultsManager.set(encoded, forKey: UserDefaultsManager.keyApiList)
                listTableView.reloadData()
            }
        }
    }
    
    private func setupTableView() {
        listTableView.register(UINib(nibName: "ListTableViewCell", bundle: Bundle(for: type(of: self))), forCellReuseIdentifier: "listcell")
        listTableView.delegate = self
        listTableView.dataSource = self
    }
    
    @IBAction func actionBtnHandle(_ sender: UIButton) {
        // 추가버튼
        if sender.tag == 0 {
            let storyboard = UIStoryboard(name : "InsertVC", bundle: Bundle.main)
            let afterVC = storyboard.instantiateViewController(identifier: "InsertVC")
            guard let secondViewController = afterVC as? InsertVC else { return }
            secondViewController.modalTransitionStyle = .coverVertical
            secondViewController.modalPresentationStyle = .fullScreen
            self.present(secondViewController, animated: true, completion: nil)
        }
        // 삭제버튼
        else {
            print("삭제")
            list.removeLast()
            
            DispatchQueue.main.async {
                let encoded = CodableManager.operateEncode(self.list)
                UserDefaultsManager.set(encoded, forKey: UserDefaultsManager.keyApiList)
                self.countLabel.text = String(self.list.count)
                self.listTableView.reloadData()
            }
        }
    }

}

extension ListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "listcell", for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        cell.setInfo(info: list[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name : "UpdateVC", bundle: Bundle.main)
        let afterVC = storyboard.instantiateViewController(identifier: "UpdateVC")
        
        guard let secondViewController = afterVC as? UpdateVC else { return }
        secondViewController.modalTransitionStyle = .coverVertical
        secondViewController.modalPresentationStyle = .fullScreen
        secondViewController.indexPath = indexPath.row
        self.present(secondViewController, animated: true, completion: nil)
    }
    
}
