//
//  Utils.swift
//  CustomAlertController
//
//  Created by Anton Stremovskiy on 6/16/17.
//  Copyright © 2017 áSoft. All rights reserved.
//

import Foundation
import UIKit



public class AlertController: UIViewController {
    
    @IBOutlet weak var buttonsStack: UIStackView!
    @IBOutlet weak var labelsStack: UIStackView!
    @IBOutlet weak var fieldsStack: UIStackView!
    @IBOutlet weak var imagesStack: UIStackView!
    @IBOutlet var containerView: UIView!

    private var controls:[UIView]               = [UIView]()
    var buttonsLayout: UILayoutConstraintAxis   = .horizontal
    static public var alertCornerRadius         = CGFloat(8)
    static public var buttonDefaultCornerRadius = CGFloat(4)
    static public var animationDuration         = TimeInterval(0.2)
    static public var maximumImageHeight        = CGFloat(80)

    convenience init() {
        self.init(nibName: String.init(describing: AlertController.self), bundle: Bundle.main)
        self.modalPresentationStyle = .overFullScreen
        self.modalTransitionStyle = .coverVertical
    }
    
    convenience init(layout: UILayoutConstraintAxis) {
        self.init(nibName: String.init(describing: AlertController.self), bundle: Bundle.main)
        self.modalPresentationStyle = .overFullScreen
        self.modalTransitionStyle = .coverVertical
        buttonsLayout = layout
    }
    
    override public func loadView() {
        super.loadView()
        internalLoadViews()
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unloadSubViews()
    }
    
    private func unloadSubViews() {
        
        controls.forEach { element in
            switch element {
            case let x where element is UIImageView:
                imagesStack.removeArrangedSubview(x)
            case let x where element is AlertTextField:
                fieldsStack.removeArrangedSubview(x)
            case let x where element is UILabel:
                labelsStack.removeArrangedSubview(x)
            case let x where element is AlertButton:
                buttonsStack.removeArrangedSubview(x)
            case let x where element is RatingView:
                labelsStack.removeArrangedSubview(x)
            default:
                break
            }
        }
    }
    
    
    private func internalLoadViews() {
        containerView.clipsToBounds = true
        
        controls.forEach { element in
            switch element {
            case let x where element is UIImageView:
                imagesStack.addArrangedSubview(x)
            case let x where element is AlertTextField:
                fieldsStack.addArrangedSubview(x)
                fieldsStack.setNeedsLayout()
                fieldsStack.layoutIfNeeded()
            case let x where element is UILabel:
                labelsStack.addArrangedSubview(x)
                labelsStack.setNeedsLayout()
                labelsStack.layoutIfNeeded()
            case let x where element is AlertButton:
                 buttonsStack.addArrangedSubview(x)
            case let x where element is RatingView:
                labelsStack.insertArrangedSubview(x, at: 0)
            default:
                break
            }
        }
        
        
        containerView.backgroundColor = UIColor.asWhite
        view.backgroundColor = UIColor.black.withAlphaComponent(0)
        
        switch buttonsLayout {
        case _ where buttonsLayout == .vertical:
            self.buttonsStack.axis         = .vertical
            self.buttonsStack.alignment    = .fill
            self.buttonsStack.distribution = .fillEqually
            self.buttonsStack.spacing      = 10
        default:
            break
        }

        containerView.layer.cornerRadius = AlertController.alertCornerRadius
        containerView.clipsToBounds      = true
        containerView.sizeToFit()
    }
    
    @discardableResult
    static public func showWarningAlert(with title: NSAttributedString?,
                                 message: NSAttributedString?,
                                 image: UIImage?,
                                 buttonsLayout: UILayoutConstraintAxis,
                                 buttons: [AlertButton]?,
                                 labels: [NSAttributedString]) -> AlertController {
        
        let alert = AlertController(layout: buttonsLayout)
        
        guard let buttons = buttons else { return alert }
        
        alert.controls = buttons
        alert.controls.forEach { ($0 as? AlertButton)?.closeAction = alert.closeAction() }
        labels.forEach { alert.controls.append(getLabel(text: $0)) }
        if let image = image { alert.controls.append(getImage(image: image)) }

        return alert
    }
    
    @discardableResult
    static public func showInputAlert(with title: NSAttributedString?,
                                        message: NSAttributedString?,
                                        image: UIImage?,
                                        buttonsLayout: UILayoutConstraintAxis,
                                        buttons: [AlertButton]?,
                                        labels: [NSAttributedString],
                                        textFields: [AlertTextField]?) -> AlertController {
        
        let alert = AlertController(layout: buttonsLayout)
        
        guard let buttons = buttons else { return alert }
        guard let textFields = textFields else { return alert }
        
        alert.controls = buttons
        if let image = image { alert.controls.append(getImage(image: image)) }
        alert.controls.forEach { ($0 as? AlertButton)?.closeAction = alert.closeAction() }
        labels.forEach { alert.controls.append(getLabel(text: $0)) }
        textFields.forEach { alert.controls.append($0) }
        
        return alert
    }
    
    
    @discardableResult
    static public func showRatingAlert(with title: NSAttributedString?,
                                      image: UIImage?,
                                      buttonsLayout: UILayoutConstraintAxis,
                                      buttons: [AlertButton]?,
                                      rating: RatingView?,
                                      textFields: [AlertTextField]?) -> AlertController {
        
        let alert = AlertController(layout: buttonsLayout)
        
        guard let buttons = buttons else { return alert }
        guard let rating = rating else { return alert }
        guard let textFields = textFields else { return alert }

        alert.controls = buttons
        if let image = image { alert.controls.append(getImage(image: image)) }
        //alert.controls.forEach { ($0 as? AlertButton)?.closeAction = alert.closeAction() }
        if let title = title { alert.controls.append(getLabel(text: title)) }
        alert.controls.append(rating)
        textFields.forEach { alert.controls.append($0) }
   
        return alert
    }



    /*@discardableResult
    func getButton(text: String,
                   isDismissable: Bool = false,
                   backgroundColor: UIColor = UIColor.clear,
                   action: (() -> Void)?) -> AlertButton {
        
        let button = AlertButton()
        button.layer.cornerRadius = AlertController.buttonDefaultCornerRadius
        button.isDismissable = AlertButton.isDismissable
        button.layer.masksToBounds = true
        button.backgroundColor = backgroundColor
        button.setTitleColor(UIColor.asCoolBlueTwo, for: .normal)
        button.action = action
        button.closeAction = closeAction()
        button.setNeedsLayout()
        button.layoutIfNeeded()
        
        return button
    }*/
    
    @discardableResult
    func getTextField(text: String,
                      placeholder: String,
                      background: UIColor? = .asWhite,
                      action: ((_ text: String) -> Void)?) -> AlertTextField {
        
        let textField = AlertTextField()
        textField.text = text
        textField.placeholder = placeholder
        textField.action = action
        textField.backgroundColor = background
        textField.setNeedsLayout()
        textField.layoutIfNeeded()
    
        return textField
    }
    
    //MARK: - TODO: future iterations
    
    override public func setupSpringAnimation(with layer: CALayer) {
        let anim             = CASpringAnimation(keyPath: "transform.rotation")
        anim.fromValue       = 0.3
        anim.toValue         = 0
        anim.damping         = 5
        anim.speed           = 3
        anim.initialVelocity = 10
        anim.duration        = 1
        layer.add(anim, forKey: "mySpring")
    }


    
    internal func closeAction() -> () -> Void {
        let closeAction = {
            self.dismiss(animated: false, completion: {
                UIView.animate(withDuration: AlertController.animationDuration, animations: { [weak self] _ in
                    self?.view.backgroundColor = UIColor.white.withAlphaComponent(1)
                })
            })
        }
        
        return closeAction
    }

    static func getLabel(text: NSAttributedString) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.attributedText = text
        return label
    }
    
    static func getImage(image: UIImage) -> UIImageView {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
}


