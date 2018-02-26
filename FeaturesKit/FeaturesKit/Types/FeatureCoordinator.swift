// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation

public protocol FeatureCoordinatorDelegate: CoordinatorDelegate {}

public protocol FeatureCoordinator: Coordinator {
  weak var coordinatorDelegate: FeatureCoordinatorDelegate? { get set }
}

extension FeatureCoordinator {
  public weak var coordinatorDelegate: FeatureCoordinatorDelegate? {
    get { return nil }
    set { return }
  }
}
