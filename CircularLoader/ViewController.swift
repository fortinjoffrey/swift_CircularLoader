//
//  ViewController.swift
//  CircularLoaderLBTA
//
//  Created by Joffrey Fortin on 18/05/2020.
//  Copyright © 2020 Joffrey Fortin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var shapeLayer = CAShapeLayer()
    
    var pulsatingLayer: CAShapeLayer!
    
    let percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "Start"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        
        setupCircleLayers()
        setupPercentageLabel()
    }
    
    private func setupCircleLayers() {
        
        pulsatingLayer = createCircleShapeLayer(strokeColor: .clear, fillColor: .pulsatingFillColor)
        _ = createCircleShapeLayer(strokeColor: .trackStrokeColor, fillColor: .backgroundColor)
    }
    
    fileprivate func setupPercentageLabel() {
        view.addSubview(percentageLabel)
        percentageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        percentageLabel.center = view.center
    }
    
    private func createCircleShapeLayer(strokeColor: UIColor, fillColor: UIColor) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = 20
        layer.fillColor = fillColor.cgColor
        layer.lineCap = CAShapeLayerLineCap.round
        layer.position = view.center
        view.layer.addSublayer(layer)
        return layer
    }
}



