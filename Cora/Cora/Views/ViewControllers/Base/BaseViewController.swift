//
//  BaseViewController.swift
//  Cora
//
//  Created by Fabio Quintanilha on 06/04/24.
//

import UIKit
import CoraUI

class BaseViewController: UIViewController {

    weak var delegate: CoordinatorDelegate?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }

    private func commonInit() {
        stylePresentation()
    }

    func stylePresentation() {
        modalPresentationStyle = .overFullScreen
        view.backgroundColor = ThemeManager.current.backgroundColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addNavigationBackButton()
    }

    func addNavigationBackButton() {
        let image = UIImage(named: ImageAssets.backLeft)?.withRenderingMode(.alwaysTemplate).withTintColor(ThemeManager.current.primaryColor)
        let barButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(backButtonTapped))
        barButtonItem.tintColor = ThemeManager.current.primaryColor
        navigationItem.leftBarButtonItem = barButtonItem
    }

    @objc func backButtonTapped() {
        delegate?.previousView()
    }
}
