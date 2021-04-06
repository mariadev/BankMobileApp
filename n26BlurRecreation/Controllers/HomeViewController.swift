//
//  ViewController.swift
//  n26BlurRecreation
//
//  Created by Maria on 30/03/2021.
//

import UIKit

protocol TableViewControllerDelegate: class {

    func tableViewControllerDelegate (_ viewController: HomeViewController, didSelectTableRow operation: DataOperation)

}

class HomeViewController : UIViewController , UIGestureRecognizerDelegate{
    
    var model: [DataOperationsByMonth]
    
    let twoRowsView = TwoRowsView()
    let header = Header()
    let wrapper = CustomUIView()
    
    var tableView = UITableView(frame: UIScreen.main.bounds, style: .grouped)
    let customeTableViewCell = "CustomeTableViewCell"
    
    var blurState: Bool = false
    
    init(model:[DataOperationsByMonth]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addImagesFixSize()
        style()
        layout ()
        
        let swipeDown = UISwipeGestureRecognizer(target: self,action: #selector( respondToSwipeGesture))
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector( respondToSwipeGesture))
        
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        swipeUp.delegate = self
        
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.register(CustomCell.self, forCellReuseIdentifier: customeTableViewCell)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model[section].operations.count
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionView = CustomSectionView()
        sectionView.title.text = model[section].month
        
        return sectionView
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: customeTableViewCell , for: indexPath) as! CustomCell
        cell.companyName.text = model[indexPath.section].operations[indexPath.row].companyName
        cell.price.text = model[indexPath.section].operations[indexPath.row].price
        cell.date.text = model[indexPath.section].operations[indexPath.row].date
        cell.icon.image = UIImage(named: model[indexPath.section].operations[indexPath.row].image)
        
        cell.price.isBlurring = blurState
        
        return cell
    }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("I WAS selected", indexPath.row)
    
        }
}

extension HomeViewController {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                blurState = false
                tableView.reloadData()
                gesture.delegate = self
            case UISwipeGestureRecognizer.Direction.down:
                blurState = true
                tableView.reloadData()
            default:
                break
            }
        }
    }
    
}

extension HomeViewController {
    
    func layout () {
        view.addSubview(wrapper)
        wrapper.edgeToSafeArea(view, constant: Constants.paddingLeftRight)
        
        wrapper.VStack(header,
                       twoRowsView,
                       tableView,
                       spacing: Constants.spacing,
                       distribution: .fill)
    }
    
    func addImagesFixSize() {
        let computedHeight = view.frame.height / 5
        twoRowsView.setHeight(computedHeight / 1.5)
        header.setHeight(computedHeight / 4)
    }
    
    func style() {
        view.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        
    }
    
}
