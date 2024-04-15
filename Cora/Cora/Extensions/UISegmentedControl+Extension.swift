//
//  UISegmentedControl+Extension.swift
//  Cora
//
//  Created by Fabio Quintanilha on 10/04/24.
//

import UIKit
import CoraUI

extension UISegmentedControl{

    func removeBorder(){

        let background = UIImage.getSegRect(color: UIColor.clear.cgColor, andSize: self.bounds.size) // segment background color and size

        self.setBackgroundImage(background, for: .normal, barMetrics: .default)

        self.setBackgroundImage(background, for: .selected, barMetrics: .default)

        self.setBackgroundImage(background, for: .highlighted, barMetrics: .default)


        let dividerLine = UIImage.getSegRect(color: UIColor.clear.cgColor, andSize: CGSize(width: 1.0, height: 5))

        self.setDividerImage(dividerLine, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)

        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:ThemeManager.current.grayTextColor], for: .normal)

        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: ThemeManager.current.primaryColor], for: .selected)

    }

    func highlightSelectedSegment() {
        removeBorder()
        self.subviews.forEach { $0.constraints.forEach { $0.isActive = false } }

        let underlineHeight: CGFloat = 2.0
        let underlineYPosition = self.bounds.height - underlineHeight
        let underLine = UIView(frame: CGRect(x: 0, y: underlineYPosition, width: 0, height: underlineHeight))
        underLine.backgroundColor = ThemeManager.current.primaryColor
        underLine.tag = 1
        self.addSubview(underLine)

        if let segmentTitle = self.titleForSegment(at: self.selectedSegmentIndex),
           let fontAttributes = self.titleTextAttributes(for: .normal) {
            let textSize = (segmentTitle as NSString).size(withAttributes: fontAttributes)
            let count = CGFloat(self.numberOfSegments)
            let segmentWidth = self.bounds.width / count
            let textWidth = segmentWidth - textSize.width
            let leadingInset = (segmentWidth - textWidth) / 2
            let lineXPosition = CGFloat(self.selectedSegmentIndex) * segmentWidth

            underLine.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                underLine.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
                underLine.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: lineXPosition),
                underLine.widthAnchor.constraint(equalToConstant: segmentWidth),
                underLine.heightAnchor.constraint(equalToConstant: underlineHeight)
            ])
        }
    }

    func underlinePosition(){
        guard let underLine = self.viewWithTag(1) else {return}
        underLine.isHidden = self.titleForSegment(at: self.selectedSegmentIndex) == nil 

        if let segmentTitle = self.titleForSegment(at: self.selectedSegmentIndex),
           let fontAttributes = self.titleTextAttributes(for: .normal) {
            let textSize = (segmentTitle as NSString).size(withAttributes: fontAttributes)

            // Calculate X position based on text size
            let count = CGFloat(self.numberOfSegments)
            let segmentWidth = self.bounds.width / count
            let textWidth = textSize.width + 10

            // Centering the underline view under the text
            let leadingInset = (segmentWidth - textWidth) / 2
            let lineXPosition = CGFloat(self.selectedSegmentIndex) * segmentWidth + leadingInset

            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
                underLine.frame.origin.x = lineXPosition
            })
        }
    }
}
