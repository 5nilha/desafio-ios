//
//  TransactionsViewController.swift
//  Cora
//
//  Created by Fabio Quintanilha on 07/04/24.
//

import UIKit
import CoraUI

enum TransactionsCategories: String {
    case allTransactions = "Tudo"
    case income = "Entrada"
    case outcome = "Saída"
    case future = "Futuro"
    case filter
}

class TransactionsViewController: BaseViewController {
    let items = ["Tudo", "Entrada", "Saída", "Futuro"]
    var segmentedControl: UISegmentedControl!
    var transactions: [CoraUITransactionViewModeling] = []
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        addNavigationRightButton()
        title = "Extrato"


        segmentedControl = UISegmentedControl(items: items)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.backgroundColor = .clear
        segmentedControl.selectedSegmentTintColor = .red

        segmentedControl.insertSegment(with: UIImage(named: ImageAssets.filter), at: segmentedControl.numberOfSegments, animated: false)
        segmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)

        segmentedControl.selectedSegmentIndex = 0 // Select the first segment by default
        // Customize the colors, font, and style of the segmented control
        segmentedControl.tintColor = .red
        segmentedControl.highlightSelectedSegment()

        view.addSubview(segmentedControl)
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            segmentedControl.leftAnchor.constraint(equalTo: view.leftAnchor),
            segmentedControl.rightAnchor.constraint(equalTo: view.rightAnchor),
            segmentedControl.heightAnchor.constraint(equalToConstant: 60)
        ])

        setupTableView()
        loadTransactions()
    }

    @objc func segmentedValueChanged(_ sender:UISegmentedControl!) {
        segmentedControl.underlinePosition()
        segmentedControl.tintColor = ThemeManager.current.primaryColor
    }

    func addNavigationRightButton() {
        let image = UIImage(named: ImageAssets.download)?.withRenderingMode(.alwaysTemplate).withTintColor(ThemeManager.current.primaryColor)
        let barButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(downloadButtonTapped))
        barButtonItem.tintColor = ThemeManager.current.primaryColor
        navigationItem.rightBarButtonItem = barButtonItem
    }

    @objc func downloadButtonTapped() {
    }

    private func setupTableView() {
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.allowsSelection = false
        tableView.alwaysBounceVertical = false
        tableView.register(TransactionTableViewCell.self, forCellReuseIdentifier: "TransactionCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])

        // Additional styles to match the uploaded image
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
    }

    private func loadTransactions() {
        let transaction = TransactionViewModel(imageName: ImageAssets.incomeTransaction, amount: "R$ 30.00", description: "Pagamento recebido AME", sender: "Guy Edwards", time: "08:48", transactionType: .income, category: "Hoje")
        let transaction1 = TransactionViewModel(imageName: ImageAssets.barcode, amount: "R$ 20.00", description: "Deposito via boleto", sender: "Leonardo Silva ME", time: "10:30", transactionType: .deposit, category: "Hoje")
        let transaction2 = TransactionViewModel(imageName: ImageAssets.returnTransaction, amount: "R$ 30.00", description: "Transferencia Estornada", sender: "Daniela Andrade", time: "13:17", transactionType: .returned, category: "Hoje")
        let transaction3 = TransactionViewModel(imageName: ImageAssets.outcomeTransaction, amount: "R$ 40.00", description: "Transferencia enviada", sender: "Boleto Pago", time: "09:22", transactionType: .outcome, category: "Hoje")
        transactions.append(transaction)
        transactions.append(transaction1)
        transactions.append(transaction2)
        transactions.append(transaction3)
        tableView.reloadData()
    }

}

extension TransactionsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        // Here we could be grouping transactions by their category e.g., "Hoje", "Ontem"
        return 3
        let categories = Set(transactions.map { $0.category })
        return categories.count
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 32))
        view.backgroundColor = ThemeManager.current.lightColor

        let label = CoraLabel(text: "Hoje - 6 de Agosto")
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = CoraFonts.regular(ofSize: 12).font
        label.textColor = ThemeManager.current.grayTextColor

        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        return view
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.identifier, for: indexPath) as! TransactionTableViewCell
        let transaction = transactions[indexPath.row]
        cell.configure(with: transaction)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
