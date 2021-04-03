//
//  ViewController.swift
//  n26BlurRecreation
//
//  Created by Maria on 30/03/2021.
//

import UIKit

protocol StoriesListViewControllerDelegate: class {
    
    func storiesListViewController (_ viewController: HomeViewController, didSelectStory story: Table)
    
}

class HomeViewController : UIViewController, UITableViewDelegate , UIGestureRecognizerDelegate {
    
    let model: [Table]
    var delegate: StoriesListViewControllerDelegate?
    var blurState: Bool = false
    let twoRowsView = TwoRowsView()
    let header = Header()
    let wrapper = CustomUIView()
    
    init(model: [Table]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        for family: String in UIFont.familyNames
             {
                 print(family)
                 for names: String in UIFont.fontNames(forFamilyName: family)
                 {
                     print("== \(names)")
                 }
             }
        super.viewDidLoad()
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector( respondToSwipeGesture))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
          self.view.addGestureRecognizer(swipeUp)
          
        let swipeDown = UISwipeGestureRecognizer(target: self,action: #selector( respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
          self.view.addGestureRecognizer(swipeDown)
        swipeUp.delegate = self
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
    
    let sections = ["May"]
    let firstLabel = UILabel()
    var tableView = UITableView(frame: UIScreen.main.bounds, style: .grouped)
    let customeTableViewCell = "CustomeTableViewCell"
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        appyTheme()
        setupLayout ()
        tableView.register(CustomCell.self, forCellReuseIdentifier: customeTableViewCell)
        tableView.dataSource = self
        tableView.delegate = self

        let computedHeight = view.frame.height / 2
    }
    
 
}


extension HomeViewController: UITableViewDataSource {
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(model.count)
        return model.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerView = UIView()

        let sectionLabel = UILabel(frame: CGRect(x: 20, y: 0, width:
        tableView.bounds.size.width, height: tableView.bounds.size.height))
        sectionLabel.text = self.sections[section]
        sectionLabel.sizeToFit()
        sectionLabel.font = UIFont(name:"BloggerSans-Light",size:18)
        headerView.addSubview(sectionLabel)

        return headerView
           
        }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: customeTableViewCell , for: indexPath) as! CustomCell
        cell.companyName.text = model[indexPath.row].companyName
        cell.price.text = model[indexPath.row].price
        cell.date.text = model[indexPath.row].date
        cell.icon.image = model[indexPath.row].image
        cell.layout()
        cell.backgroundColor = .clear
        cell.isOpaque = false
        cell.price.isBlurring = blurState
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let story =  model[indexPath.row]
        
//        let storiesDetailViewController = StoriesDetailViewController(model: story)
         delegate?.storiesListViewController(self, didSelectStory: story)
        
    }
}

extension HomeViewController {
    
    func setupLayout () {
        let computedHeight = view.frame.height / 5
        let computedWidth = view.frame.width
        wrapper.VStack(header,
            twoRowsView,
                        tableView,
                        spacing: 8,
                        distribution: .fill)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        firstLabel.text = "hola"
        view.addSubview(wrapper)
        wrapper.edgeToSafeArea(view)
        twoRowsView.setHeight(computedHeight)
        header.setHeight(computedHeight/4)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.topAnchor.constraint(equalTo:  firstView.bottomAnchor).isActive = true
    
    }
    
    func appyTheme() {
        view.backgroundColor = .white
        
    }
    
}
