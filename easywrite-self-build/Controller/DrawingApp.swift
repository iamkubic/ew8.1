//
//  DrawingApp.swift
//  easywrite-self-build
//
//  Created by Vighnesh Pradhan on 08/04/23.
//

import UIKit

class DrawingApp: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    // DrawingView.swift


        private var lastPoint: CGPoint!
        private var strokeColor: UIColor = .black
        private var strokeWidth: CGFloat = 3.0
        private var strokes: [Stroke] = []

        override func draw(_ rect: CGRect) {
            for stroke in strokes {
                stroke.color.setStroke()
                stroke.path.stroke()
            }
        }

        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            guard let touch = touches.first else { return }
            lastPoint = touch.location(in: self)
        }

        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            guard let touch = touches.first else { return }
            let currentPoint = touch.location(in: self)

            let path = UIBezierPath()
            path.move(to: lastPoint)
            path.addLine(to: currentPoint)

            strokes.append(Stroke(path: path, color: strokeColor))
            lastPoint = currentPoint

            setNeedsDisplay()
        }

        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            touchesMoved(touches, with: event)
        }

        func clear() {
            strokes.removeAll()
            setNeedsDisplay()
        }

        func setStrokeColor(_ color: UIColor) {
            strokeColor = color
        }

        func setStrokeWidth(_ width: CGFloat) {
            strokeWidth = width
        }

        struct Stroke {
            let path: UIBezierPath
            let color: UIColor
        }
    }



