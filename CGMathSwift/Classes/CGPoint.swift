//
//  CGPoint.swift
//  Pods
//
//  Created by Emilio Peláez on 11/10/16.
//
//

import Foundation

public func lerp(min: CGPoint, max: CGPoint, progress: CGFloat) -> CGPoint {
	return CGPoint(x: lerp(min: min.x, max: max.x, progress: progress),
	               y: lerp(min: min.y, max: max.y, progress: progress))
}

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
