//
//  CGRect.swift
//  Pods
//
//  Created by Emilio Peláez on 11/10/16.
//
//

import Foundation

public func lerp(start: CGRect, end: CGRect, progress: CGFloat) -> CGRect {
	let origin = lerp(start: start.origin, end: end.origin, progress: progress)
	let size = lerp(start: start.size, end: end.size, progress: progress)
	return CGRect(origin: origin, size: size)
}

//	MARK: - CGRect
public extension CGRect {
	public var center: CGPoint {
		return CGPoint(x: midX, y: midY)
	}
	
	public init(center: CGPoint, size: CGSize) {
		origin = CGPoint(x: center.x - size.width/2,
		                 y: center.y - size.height/2)
		self.size = size
	}
	
	public func withAspectRatio(_ ratio: CGFloat) -> CGRect {
		return CGRect(center: center, size: CGSize(aspectRatio: ratio, maxSize: size))
	}
}
