//
//  TourDetailViewController.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 23.04.2024.
//

import UIKit

class TourDetailViewController: UIViewController {
    
    var viewModel: TourDetailViewModelProtocol!
    
    private lazy var blackView: UIView = {
        let view = UIView(frame: view.bounds)
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        view.isHidden = true
        return view
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(TourDetailTopCell.self, forCellReuseIdentifier: TourDetailTopCell.id)
        tableView.register(TourDetailBottomCell.self, forCellReuseIdentifier: TourDetailBottomCell.id)
        tableView.contentInsetAdjustmentBehavior = .never
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.addSubview(blackView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func blackOutView() {
        blackView.isHidden.toggle()
        
    }
    
    private func showAlert() {
        let alertVC = AlertViewController()
        alertVC.modalPresentationStyle = .overCurrentContext
        alertVC.modalTransitionStyle = .crossDissolve
        present(alertVC, animated: true)
    }
}

extension TourDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TourDetailTopCell.id, for: indexPath) as! TourDetailTopCell
//            cell.viewModel = viewModel.getDataForTopCell()
            return cell
        } else {

            let cell = tableView.dequeueReusableCell(withIdentifier: TourDetailBottomCell.id, for: indexPath) as! TourDetailBottomCell

            cell.viewModel = viewModel.getDataForBottomCell()
            cell.selectionStyle = .none
            return cell
        }
    }
    
}

extension TourDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 389
        } else {
            return UITableView.automaticDimension
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            cell.layer.zPosition = 1
        }
    }
}


