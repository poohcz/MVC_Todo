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
    var firstFlag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callApi()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        if let savedData = UserDefaults.standard.object(forKey: UserDefaultsManager.keyArrayList) as? Data {
            let decoder = JSONDecoder()
            
            var savedObject = try? decoder.decode([TestModel].self, from: savedData)
            list = savedObject ?? [TestModel(id: 0, userId: 0, body: "nil", title: "nil")]
            
        }
        
        listTableView.reloadData()
    }
    
    private func callApi() {
        if firstFlag {
            return
        }
        
        D_Network.shared.fetchDataFromAPI { [weak self] (items, error) in
            guard let self = self else { return }
            firstFlag = true

            if let error = error {
                print("Error: \(error)")
            } else if let items = items {
                
                let encoder = JSONEncoder()
                
                // 담는거1
                if let encoded = try? encoder.encode(items) {
                    UserDefaultsManager.set(encoded, forKey: UserDefaultsManager.keyArrayList)
                }
                
                list = items

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
            print("추가")
            
            let storyboard = UIStoryboard(name : "InsertVC", bundle: Bundle.main)
            let afterVC = storyboard.instantiateViewController(identifier: "InsertVC")
            
            
            guard let secondViewController = afterVC as? InsertVC else { return }
                    // 화면 전환 애니메이션 설정
                    secondViewController.modalTransitionStyle = .coverVertical
                    // 전환된 화면이 보여지는 방법 설정 (fullScreen)
                    secondViewController.modalPresentationStyle = .fullScreen
                    self.present(secondViewController, animated: true, completion: nil)
        }
        // 삭제버튼
        else {
            print("삭제")
            list.removeLast()
            let encoder = JSONEncoder()
            
            // 담는거1
            if let encoded = try? encoder.encode(list) {
                UserDefaultsManager.set(encoded, forKey: UserDefaultsManager.keyArrayList)
            }
            print("삭제완료")
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
                // 화면 전환 애니메이션 설정
                secondViewController.modalTransitionStyle = .coverVertical
                // 전환된 화면이 보여지는 방법 설정 (fullScreen)
                secondViewController.modalPresentationStyle = .fullScreen
                self.present(secondViewController, animated: true, completion: nil)
    }
    
}
