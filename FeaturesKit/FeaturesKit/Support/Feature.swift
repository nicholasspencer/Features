// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation

public protocol FeatureDelegate: class {}

open class Feature: Coordinator {
  open weak var featureDelegate: FeatureDelegate?

  public init() {}
}
