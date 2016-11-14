//
//  CGPoint.swift
//  Pods
//
//  Created by Emilio Peláez on 11/10/16.
//
//

import Foundation

public func lerp(start: CGPoint, end: CGPoint, progress: CGFloat) -> CGPoint {
	return CGPoint(x: lerp(start: start.x, end: end.x, progress: progress),
	               y: lerp(start: start.y, end: end.y, progress: progress))
}

extension CGPoint {
	public var magnitude: CGFloat {
		return sqrt(x * x + y * y)
	}
	
	public var normalized: CGPoint {
		let m = magnitude
		return self/m
	}
	
	mutating public func normalize() {
		let m = magnitude
		x /= m
		y /= m
	}
	
	static func add(_ points: [CGPoint]) -> CGPoint {
		return points.reduce(CGPoint.zero, +)
	}
	
	static func average(_ points: [CGPoint]) -> CGPoint {
		return CGPoint.add(points) / CGFloat(points.count)
	}
}

public func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
	return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

public func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
	return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
}

public func *(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
	return CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
}

public func /(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
	return CGPoint(x: lhs.x / rhs, y: lhs.y / rhs)
}

public func +=(lhs: inout CGPoint, rhs: CGPoint) {
	lhs.x += rhs.x
	lhs.y += rhs.y
}

public func -=(lhs: inout CGPoint, rhs: CGPoint) {
	lhs.x -= rhs.x
	lhs.y -= rhs.y
}

public func *=(lhs: inout CGPoint, rhs: CGFloat) {
	lhs.x *= rhs
	lhs.y *= rhs
}

public func /=(lhs: inout CGPoint, rhs: CGFloat) {
	lhs.x /= rhs
	lhs.y /= rhs
}
