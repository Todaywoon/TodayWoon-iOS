//
//  BaseView.swift
//  TodayWoon
//
//  Created by 이숭인 on 6/1/24.
//

import UIKit

open class BaseView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func beforeSetup() {

    }

    open func setup() {
        beforeSetup()

        backgroundColor = .white
        setupSubviews()
        setupConstraints()

        afterSetup()
    }

    open func setupSubviews() {

    }

    open func setupConstraints() {

    }

    open func afterSetup() {

    }

    open override var canBecomeFocused: Bool {
        false
    }
}

