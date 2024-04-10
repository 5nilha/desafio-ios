//
//  CoraLabel.swift
//
//
//  Created by Fabio Quintanilha on 09/04/24.
//

import UIKit

public class CoraLabel: UILabel {

    public enum AttributeType {
        case strikethrough
        case regular

        var attribute: NSAttributedString.Key? {
            switch self {
            case .strikethrough:
                return NSAttributedString.Key.strikethroughStyle
            default:
                return nil
            }
        }
    }

    var attributeType: AttributeType = .regular
    var attributeString: NSMutableAttributedString?

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    public convenience init(_ attributeType: AttributeType = .regular, text: String? = nil) {
        self.init(frame: .zero)
        self.attributeType = attributeType
        super.text = text
        setAttributedText()
    }

    public override var text: String? {
        didSet {
            guard let txt = text else { return }
            setAttributedText()
            super.text = self.attributedText?.string ?? text
        }
    }

    private func setupUI() {
        setAttributedText()
    }

    private func setAttributedText() {
        switch attributeType {
        case .strikethrough:
            guard let txt = text else { return }
            attributeString = NSMutableAttributedString(string: txt)
            attributeString?.addAttribute(
                NSAttributedString.Key.strikethroughStyle,
                value: NSUnderlineStyle.single.rawValue,
                range: NSRange(location: 0, length: attributeString?.length ?? 0)
            )
            self.attributedText = attributeString

        case .regular:
            break
        }
    }
}
