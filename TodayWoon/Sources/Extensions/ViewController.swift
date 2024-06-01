//
//  ViewController.swift
//  TodayWoon
//
//  Created by 이숭인 on 6/1/24.
//

import UIKit
import Combine

class ViewController<ContentView: UIView>: ContentViewController<ContentView> {
    public override init() {
        super.init()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupKeyboardDismissalableIfNeeded()
    }

    open func setupSubviews() {

    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

// MARK: - setup protocols
extension ViewController {
    private func setupKeyboardDismissalableIfNeeded() {
        guard let keyboardDismissalable = self as? KeyboardDismissalable else { return }
        keyboardDismissalable.setupKeyboardDismissal()
    }
}

public protocol KeyboardDismissalable: UIViewController {
    func setupKeyboardDismissal()
}

extension KeyboardDismissalable {
    public func setupKeyboardDismissal(cancellables: inout Set<AnyCancellable>) {
        let tapGesture = UITapGestureRecognizer()
        view.addGestureRecognizer(tapGesture)
        
        tapGesture.tapPublisher
            .sink { [weak self] _ in
                self?.view.endEditing(true)
                self?.inputAccessoryView?.resignFirstResponder()
            }
            .store(in: &cancellables)
    }
}
