//
//  CGFloatTests.swift
//  CGMathSwift
//
//  Created by Emilio Peláez on 11/11/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import CGMathSwift

class CGFloatSpec: QuickSpec {
	override func spec() {
		describe("CGFloat") {
			let start: CGFloat = 5
			let end: CGFloat = 10
			let middle: CGFloat = (start + end) / 2
			
			let progressStart: CGFloat = 0
			let progressEnd: CGFloat = 1
			let progressMiddle: CGFloat = (progressStart + progressEnd) / 2
			
			it("lerp") {
				expect(lerp(start: start, end: end, progress: progressStart)) == start
				expect(lerp(start: start, end: end, progress: progressMiddle)) == middle
				expect(lerp(start: start, end: end, progress: progressEnd)) == end
			}
			
			it("inverseLerp") {
				expect(inverseLerp(start: start, end: end, value: start)) == progressStart
				expect(inverseLerp(start: start, end: end, value: middle)) == progressMiddle
				expect(inverseLerp(start: start, end: end, value: end)) == progressEnd
			}
			
			it("remap") {
				expect(start.remap(fromRange: (start, end), toRange: (progressStart, progressEnd))) == progressStart
				expect(middle.remap(fromRange: (start, end), toRange: (progressStart, progressEnd))) == progressMiddle
				expect(end.remap(fromRange: (start, end), toRange: (progressStart, progressEnd))) == progressEnd
			}
		}
	}
}
