// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation

public protocol CoordinatorDelegate: class {
  func coordinatorDidFinish(_ coordinator: Coordinator);
}

extension CoordinatorDelegate {
  public func coordinatorDidFinish(_ coordinator: Coordinator) {
    coordinator.coordinatorDelegate?.coordinatorDidFinish(coordinator)
  }
}

public protocol Coordinator: CoordinatorDelegate {
  weak var coordinatorDelegate: CoordinatorDelegate? { get set }
}

extension Coordinator {
  public weak var coordinatorDelegate: CoordinatorDelegate? {
    get { return nil }
    set { return }
  }
}
