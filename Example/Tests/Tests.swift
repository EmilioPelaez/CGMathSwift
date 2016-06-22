// https://github.com/Quick/Quick

import Quick
import Nimble
import CGMathSwift

class CGMathSpec: QuickSpec {
	override func spec() {
		context("CGFloat") {
			let start: CGFloat = 5
			let end: CGFloat = 10
			let middle: CGFloat = (start + end) / 2
			let progressStart: CGFloat = 0
			let progressMiddle: CGFloat = 0.5
			let progressEnd: CGFloat = 1
			
			it("Lerp") {
				expect(lerp(from: start, to: end, progress: progressStart)) == start
				expect(lerp(from: start, to: end, progress: progressMiddle)) == middle
				expect(lerp(from: start, to: end, progress: progressEnd)) == end
			}
			
			it("InverseLerp") {
				expect(inverseLerp(from: start, to: end, value: start)) == progressStart
				expect(inverseLerp(from: start, to: end, value: middle)) == progressMiddle
				expect(inverseLerp(from: start, to: end, value: end)) == progressEnd
			}
			
			it("Clamp") {
				expect((start - 1).clamp(min: start, max: end)) == start
				expect(start.clamp(min: start, max: end)) == start
				expect(middle.clamp(min: start, max: end)) == middle
				expect(end.clamp(min: start, max: end)) == end
				expect((end + 1).clamp(min: start, max: end)) == end
			}
			
			let start2: CGFloat = 15
			let end2: CGFloat = 20
			let middle2: CGFloat = (start2 + end2) / 2
			
			it("Remap") {
				expect(middle.remap(fromRange: (start, end), toRange: (start2, end2))) == middle2
			}
		}
	}
}
