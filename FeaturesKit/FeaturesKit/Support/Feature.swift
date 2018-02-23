// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation

public protocol FeatureDelegate: class {

}

public protocol Feature: class {
  weak var featureDelegate: FeatureDelegate? { get set }
}

extension Feature {
  public weak var featureDelegate: FeatureDelegate? {
    get { return nil }
    set { featureDelegate = newValue }
  }
}
