//
//  ViewController.swift
//  n26BlurRecreation
//
//  Created by Maria on 30/03/2021.
//

import UIKit

class HomeViewController: UIViewController, UIGestureRecognizerDelegate {

    var model: [DataOperationsByMonth]

    let balanceView = BalanceBarView()
    let searchBarView = SearchBarView()
    let wrapper = CustomUIView()

    var tableView = UITableView()
    let customTableViewCell = "CustomTableViewCell"

    var blurState: Bool = false

    init(model: [DataOperationsByMonth]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        resizeUI()
        style()
        layout()

        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        swipeUp.delegate = self
        view.addGestureRecognizer(swipeUp)

        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        view.addGestureRecognizer(swipeDown)

    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.register(CustomCell.self, forCellReuseIdentifier: customTableViewCell)
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

        let cell = tableView.dequeueReusableCell(withIdentifier: customTableViewCell, for: indexPath) as! CustomCell

        let operation = model[indexPath.section].operations[indexPath.row]
        cell.configure(operation: operation)
        cell.price.isBlurring = blurState

        return cell
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
        wrapper.edgeToSafeArea(view, constant: Theme.paddingLeftRight)
        let arrayViews = [searchBarView, balanceView, tableView]

        arrayViews.forEach {
            wrapper.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor.constraint(equalTo: wrapper.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: wrapper.trailingAnchor).isActive = true
        }
        searchBarView.topAnchor.constraint(equalTo: wrapper.topAnchor).isActive = true
        balanceView.topAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: 60).isActive = true
        tableView.topAnchor.constraint(equalTo: balanceView.bottomAnchor, constant: 20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: wrapper.bottomAnchor).isActive = true
    }

    func resizeUI() {
        let computedHeight = view.frame.height / 5
        balanceView.setHeight(computedHeight / 1.5)
        searchBarView.setHeight(computedHeight / 4)
    }

    func style() {
        view.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white

    }

}
