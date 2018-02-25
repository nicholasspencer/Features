// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation

public protocol FeatureDelegate: CoordinatorDelegate {}

public protocol Feature: Coordinator {
  weak var coordinatorDelegate: FeatureDelegate? { get set }
}

extension Feature {
  public weak var coordinatorDelegate: FeatureDelegate? {
    get { return nil }
    set { return }
  }
}
