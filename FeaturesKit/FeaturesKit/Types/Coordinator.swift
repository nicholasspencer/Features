// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation

public protocol CoordinatorDelegate: class {
  func coordinatorDidFinish(_ coordinator: Coordinator);
}

extension CoordinatorDelegate {
  public func coordinatorDidFinish(_ coordinator: Coordinator) {}
}

public protocol Coordinator: class {
  weak var coordinatorDelegate: CoordinatorDelegate? { get set }
}

extension Coordinator {
  public weak var coordinatorDelegate: CoordinatorDelegate? {
    get { return nil }
    set { coordinatorDelegate = newValue }
  }
}
