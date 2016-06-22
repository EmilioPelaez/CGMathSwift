//
//  CGMathSwift.swift
//  CGMathSwift
//
//  Created by Emilio Peláez on 6/22/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

//	MARK: - Lerp
public func lerp(from from: Float, to: Float, progress: Float) -> Float {
	return (1 - progress) * from + progress * to
}

public func lerp(from from: CGFloat, to: CGFloat, progress: CGFloat) -> CGFloat {
	return (1 - progress) * from + progress * to
}

public func lerp(from from: Double, to: Double, progress: Double) -> Double {
	return (1 - progress) * from + progress * to
}

public func lerp(from from: CGPoint, to: CGPoint, progress: CGFloat) -> CGPoint {
	return CGPoint(x: lerp(from: from.x, to: to.x, progress: progress),
	               y: lerp(from: from.y, to: to.y, progress: progress))
}

public func lerp(from from: CGSize, to: CGSize, progress: CGFloat) -> CGSize {
	return CGSize(width: lerp(from: from.width, to: to.width, progress: progress),
	              height: lerp(from: from.height, to: to.height, progress: progress))
}

public func lerp(from from: CGRect, to: CGRect, progress: CGFloat) -> CGRect {
	let origin = lerp(from: from.origin, to: to.origin, progress: progress)
	let size = lerp(from: from.size, to: to.size, progress: progress)
	return CGRect(origin: origin, size: size)
}

//	MARK: - Inverse Lerp
public func inverseLerp(from from: Float, to: Float, value: Float) -> Float {
	return (value - from) / (to - from)
}

public func inverseLerp(from from: CGFloat, to: CGFloat, value: CGFloat) -> CGFloat {
	return (value - from) / (to - from)
}

public func inverseLerp(from from: Double, to: Double, value: Double) -> Double {
	return (value - from) / (to - from)
}

//	MARK: - Float
extension Float {
	public func clamp(min min: Float = 0, max: Float = 1) -> Float {
		return Swift.max(min, Swift.min(max, self))
	}
	
	public func remap(fromRange from: (start: Float, end: Float), toRange to: (start: Float, end: Float)) -> Float {
		let t = inverseLerp(from: from.start, to: from.end, value: self)
		return lerp(from: to.start, to: to.end, progress: t)
	}
}

//	MARK: - CGFloat
extension CGFloat {
	public func clamp(min min: CGFloat = 0, max: CGFloat = 1) -> CGFloat {
		return Swift.max(min, Swift.min(max, self))
	}
	
	public func remap(fromRange from: (start: CGFloat, end: CGFloat), toRange to: (start: CGFloat, end: CGFloat)) -> CGFloat {
		let t = inverseLerp(from: from.start, to: from.end, value: self)
		return lerp(from: to.start, to: to.end, progress: t)
	}
}

//	MARK: - Double
extension Double {
	public func clamp(min min: Double = 0, max: Double = 1) -> Double {
		return Swift.max(min, Swift.min(max, self))
	}
	
	public func remap(fromRange from: (start: Double, end: Double), toRange to: (start: Double, end: Double)) -> Double {
		let t = inverseLerp(from: from.start, to: from.end, value: self)
		return lerp(from: to.start, to: to.end, progress: t)
	}
}

//	MARK: - CGPoint
extension CGPoint {
	public var magnitude: CGFloat {
		return sqrt(x * x + y * y)
	}
	
	public var normalized: CGPoint {
		let m = magnitude
		return CGPoint(x: x / m, y: y / m)
	}
	
	mutating public func normalize() {
		let m = magnitude
		x /= m
		y /= m
	}
}

public func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
	return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

public func +(lhs: CGPoint, rhs: [CGPoint]) -> CGPoint {
	var point = lhs
	rhs.forEach {
		point.x += $0.x
		point.y += $0.y
	}
	return point
}

public func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
	return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
}

public func *(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
	return CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
}

//	MARK: - CGSize
extension CGSize {
	public var aspectRatio: CGFloat {
		return width / height
	}
	
	public init(withAspectRatio ratio: CGFloat, thatFitsSize size: CGSize) {
		let sizeRatio = size.aspectRatio
		if ratio > sizeRatio {
			width = size.width
			height = size.width / ratio
		} else {
			width = size.height * ratio
			height = size.height
		}
	}
}

//	MARK: - CGRect
extension CGRect {
	public var center: CGPoint {
		return CGPoint(x: origin.x + width / 2,
		               y: origin.y + height / 2)
	}
	
	public init(center: CGPoint, size: CGSize) {
		origin = CGPoint(x: center.x - size.width/2,
		                 y: center.y - size.height/2)
		self.size = size
	}
	
	public func rectWithAspectRatio(ratio: CGFloat) -> CGRect {
		return CGRect(center: center, size: CGSize(withAspectRatio: ratio, thatFitsSize: size))
	}
}