//
//  ViewController.swift
//  n26BlurRecreation
//
//  Created by Maria on 30/03/2021.
//

import UIKit

protocol TableViewControllerDelegate: class {
    
    func tableViewControllerDelegate (_ viewController: HomeViewController, didSelectTableRow story: UserOperation)
    
}

class HomeViewController : UIViewController, UITableViewDelegate , UIGestureRecognizerDelegate {
    
    let model: [UserOperation]
    var delegate: TableViewControllerDelegate?
    let twoRowsView = TwoRowsView()
    let header = Header()
    let wrapper = CustomUIView()
    var blurState: Bool = false
    var tableView = UITableView(frame: UIScreen.main.bounds, style: .grouped)
    let customeTableViewCell = "CustomeTableViewCell"
    var sections: Array<String> = []
    
    init(model: [UserOperation]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTex()
        addImagesFixSize()
        style()
        layout ()
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector( respondToSwipeGesture))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
          self.view.addGestureRecognizer(swipeUp)
          
        let swipeDown = UISwipeGestureRecognizer(target: self,action: #selector( respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
          self.view.addGestureRecognizer(swipeDown)
        swipeUp.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.register(CustomCell.self, forCellReuseIdentifier: customeTableViewCell)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @objc  func respondToSwipeGesture(gesture: UIGestureRecognizer) {
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

extension HomeViewController: UITableViewDataSource {
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let title: UILabel = {
            let title = UILabel(frame: CGRect(x: 0, y: 0, width:
                        tableView.bounds.size.width, height: tableView.bounds.size.height))
            title.text = self.sections[section]
            title.sizeToFit()
            title.font = UIFont(name:Constants.fontFamily,size:Constants.sizeBig)
            return title
        }()
        
        let headerView = UIView()
        headerView.backgroundColor = .white
        headerView.addSubview(title)
        
        return headerView
           
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: customeTableViewCell , for: indexPath) as! CustomCell
        cell.companyName.text = model[indexPath.row].companyName
        cell.price.text = model[indexPath.row].price
        cell.date.text = model[indexPath.row].date
        cell.icon.image = model[indexPath.row].image
        
        cell.price.isBlurring = blurState
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let userOperations =  model[indexPath.row]
         delegate?.tableViewControllerDelegate(self, didSelectTableRow: userOperations)
        
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
        tableView.separatorStyle = .none
    }

    func addTex() {
        sections = ["May"]
    }
    
    func addImagesFixSize() {
        let computedHeight = view.frame.height / 5
        twoRowsView.setHeight(computedHeight / 1.5)
        header.setHeight(computedHeight / 4)
    }
    
    func style() {
        view.backgroundColor = .white
        
    }
    
}
