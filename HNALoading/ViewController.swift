//
//  ViewController.swift
//  HNALoading
//
//  Created by __无邪_ on 2017/8/25.
//  Copyright © 2017年 __无邪_. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var complexLoadingView: UIView!
    
    
    
    let ovalShapeLayer: CAShapeLayer = CAShapeLayer()
    let anotherOvalShapeLayer: CAShapeLayer = CAShapeLayer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        ovalShapeLayer.strokeColor = UIColor.white.cgColor
        ovalShapeLayer.fillColor = UIColor.clear.cgColor
        ovalShapeLayer.lineWidth = 7
        ovalShapeLayer.strokeEnd = 0.4
        ovalShapeLayer.lineCap = kCALineCapRound

        let ovalRadius = loadingView.frame.size.height/2 * 0.8
        ovalShapeLayer.path = UIBezierPath.init(ovalIn: CGRect.init(x: loadingView.frame.size.width/2 - ovalRadius, y: loadingView.frame.size.height/2 - ovalRadius, width: ovalRadius * 2, height: ovalRadius * 2)).cgPath
        
        loadingView.layer.addSublayer(ovalShapeLayer)
        
        
        
        
        anotherOvalShapeLayer.strokeColor = UIColor.white.cgColor
        anotherOvalShapeLayer.fillColor = UIColor.clear.cgColor
        anotherOvalShapeLayer.lineWidth = 7
        
        let anotherOvalRadius = complexLoadingView.frame.size.height/2 * 0.8
        anotherOvalShapeLayer.path = UIBezierPath(ovalIn: CGRect(x: complexLoadingView.frame.size.width/2 - anotherOvalRadius, y: complexLoadingView.frame.size.height/2 - anotherOvalRadius, width: anotherOvalRadius * 2, height: anotherOvalRadius * 2)).cgPath
        anotherOvalShapeLayer.lineCap = kCALineCapRound
        
        complexLoadingView.layer.addSublayer(anotherOvalShapeLayer)
        
        
        
        
        
        

        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        beginSimpleAnimation()
        beginComplexAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    func beginSimpleAnimation() {
        let rotate = CABasicAnimation(keyPath: "transform.rotation")
        rotate.duration = 1.5
        rotate.fromValue = 0
        rotate.toValue = 2 * Double.pi
        rotate.repeatCount = HUGE
        loadingView.layer.add(rotate, forKey: nil)
    }
    func beginComplexAnimation() {
        
        let strokeStartAnimate = CABasicAnimation(keyPath: "strokeStart")
        strokeStartAnimate.fromValue = -0.5
        strokeStartAnimate.toValue = 1
        
        let strokeEndAnimate = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimate.fromValue = 0.0
        strokeEndAnimate.toValue = 1
        
        let strokeAnimateGroup = CAAnimationGroup()
        strokeAnimateGroup.duration = 1.5
        strokeAnimateGroup.repeatCount = HUGE
        strokeAnimateGroup.animations = [strokeStartAnimate, strokeEndAnimate]
        anotherOvalShapeLayer.add(strokeAnimateGroup, forKey: nil)
    }
    
    
    
    
    
//    transform.rotation：旋转动画。
//    transform.ratation.x：按x轴旋转动画。
//    transform.ratation.y：按y轴旋转动画。
//    transform.ratation.z：按z轴旋转动画。
//    transform.scale：按比例放大缩小动画。
//    transform.scale.x：在x轴按比例放大缩小动画。
//    transform.scale.y：在y轴按比例放大缩小动画。
//    transform.scale.z：在z轴按比例放大缩小动画。
//    position：移动位置动画。
//    opacity：透明度动画。
    
    
    
    
    
    
    


}

