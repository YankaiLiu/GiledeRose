// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



// Generated with SwiftyMocky 3.5.0

import SwiftyMocky
#if !MockyCustom
import XCTest
#endif
import Foundation
@testable import GiledeRose


// MARK: - GiledeRoseInteractorProtocol
open class GiledeRoseInteractorProtocolMock: GiledeRoseInteractorProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var dataSource: [Product] {
		get {	invocations.append(.p_dataSource_get); return __p_dataSource ?? givenGetterValue(.p_dataSource_get, "GiledeRoseInteractorProtocolMock - stub value for dataSource was not defined") }
		set {	invocations.append(.p_dataSource_set(.value(newValue))); __p_dataSource = newValue }
	}
	private var __p_dataSource: ([Product])?

    public var displayDatas: ((UInt) -> Void)? {
		get {	invocations.append(.p_displayDatas_get); return __p_displayDatas ?? optionalGivenGetterValue(.p_displayDatas_get, "GiledeRoseInteractorProtocolMock - stub value for displayDatas was not defined") }
		set {	invocations.append(.p_displayDatas_set(.value(newValue))); __p_displayDatas = newValue }
	}
	private var __p_displayDatas: ((UInt) -> Void)?

    public var days: UInt {
		get {	invocations.append(.p_days_get); return __p_days ?? givenGetterValue(.p_days_get, "GiledeRoseInteractorProtocolMock - stub value for days was not defined") }
		set {	invocations.append(.p_days_set(.value(newValue))); __p_days = newValue }
	}
	private var __p_days: (UInt)?





    open func open() {
        addInvocation(.m_open)
		let perform = methodPerformValue(.m_open) as? () -> Void
		perform?()
    }

    open func close() {
        addInvocation(.m_close)
		let perform = methodPerformValue(.m_close) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_open
        case m_close
        case p_dataSource_get
		case p_dataSource_set(Parameter<[Product]>)
        case p_displayDatas_get
		case p_displayDatas_set(Parameter<((UInt) -> Void)?>)
        case p_days_get
		case p_days_set(Parameter<UInt>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_open, .m_open):
                return true 
            case (.m_close, .m_close):
                return true 
            case (.p_dataSource_get,.p_dataSource_get): return true
			case (.p_dataSource_set(let left),.p_dataSource_set(let right)): return Parameter<[Product]>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_displayDatas_get,.p_displayDatas_get): return true
			case (.p_displayDatas_set(let left),.p_displayDatas_set(let right)): return Parameter<((UInt) -> Void)?>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_days_get,.p_days_get): return true
			case (.p_days_set(let left),.p_days_set(let right)): return Parameter<UInt>.compare(lhs: left, rhs: right, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_open: return 0
            case .m_close: return 0
            case .p_dataSource_get: return 0
			case .p_dataSource_set(let newValue): return newValue.intValue
            case .p_displayDatas_get: return 0
			case .p_displayDatas_set(let newValue): return newValue.intValue
            case .p_days_get: return 0
			case .p_days_set(let newValue): return newValue.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func dataSource(getter defaultValue: [Product]...) -> PropertyStub {
            return Given(method: .p_dataSource_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func displayDatas(getter defaultValue: ((UInt) -> Void)?...) -> PropertyStub {
            return Given(method: .p_displayDatas_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func days(getter defaultValue: UInt...) -> PropertyStub {
            return Given(method: .p_days_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func open() -> Verify { return Verify(method: .m_open)}
        public static func close() -> Verify { return Verify(method: .m_close)}
        public static var dataSource: Verify { return Verify(method: .p_dataSource_get) }
		public static func dataSource(set newValue: Parameter<[Product]>) -> Verify { return Verify(method: .p_dataSource_set(newValue)) }
        public static var displayDatas: Verify { return Verify(method: .p_displayDatas_get) }
		public static func displayDatas(set newValue: Parameter<((UInt) -> Void)?>) -> Verify { return Verify(method: .p_displayDatas_set(newValue)) }
        public static var days: Verify { return Verify(method: .p_days_get) }
		public static func days(set newValue: Parameter<UInt>) -> Verify { return Verify(method: .p_days_set(newValue)) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func open(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_open, performs: perform)
        }
        public static func close(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_close, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - GiledeRoseShopProtocol
open class GiledeRoseShopProtocolMock: GiledeRoseShopProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var products: [Product] {
		get {	invocations.append(.p_products_get); return __p_products ?? givenGetterValue(.p_products_get, "GiledeRoseShopProtocolMock - stub value for products was not defined") }
		set {	invocations.append(.p_products_set(.value(newValue))); __p_products = newValue }
	}
	private var __p_products: ([Product])?






    fileprivate enum MethodType {
        case p_products_get
		case p_products_set(Parameter<[Product]>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.p_products_get,.p_products_get): return true
			case (.p_products_set(let left),.p_products_set(let right)): return Parameter<[Product]>.compare(lhs: left, rhs: right, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .p_products_get: return 0
			case .p_products_set(let newValue): return newValue.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func products(getter defaultValue: [Product]...) -> PropertyStub {
            return Given(method: .p_products_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static var products: Verify { return Verify(method: .p_products_get) }
		public static func products(set newValue: Parameter<[Product]>) -> Verify { return Verify(method: .p_products_set(newValue)) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

