
//
//  ModeViewController.swift
//  CrazyText
//
//  Created by David Linhares on 14/05/2020.
//  Copyright © 2020 David Linhares. All rights reserved.
//

import UIKit

protocol ModeViewControllerDelegate {
    func modeViewController(_ modeViewController: ModeViewController, didSelect mode: ModeViewController.Mode)
}

class ModeViewController: UIViewController {
    
    enum Mode {
        case kamelott
        case company
        case none
    }
    
    var delegate: ModeViewControllerDelegate?

    @IBOutlet weak var companyMode: UIImageView!
    @IBOutlet weak var kamelottMode: UIImageView!
    @IBOutlet weak var none: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        kamelottMode.isUserInteractionEnabled = true
        kamelottMode.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTouchKamelott)))
        
        companyMode.isUserInteractionEnabled = true
        companyMode.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTouchCompany)))
        
        none.isUserInteractionEnabled = true
        none.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTouchNone)))
    }
    
    @objc func didTouchKamelott() {
        delegate?.modeViewController(self, didSelect: .kamelott)
        self.dismiss(animated: true)
    }
    
    @objc func didTouchCompany() {
        delegate?.modeViewController(self, didSelect: .company)
        self.dismiss(animated: true)
    }
    
    @objc func didTouchNone() {
        delegate?.modeViewController(self, didSelect: .none)
        self.dismiss(animated: true)
    }
}
