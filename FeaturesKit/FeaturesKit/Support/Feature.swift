// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation

public protocol FeatureDelegate: class {}

open class Feature: Coordinator {
  public weak var featureDelegate: FeatureDelegate?

  public init() {}
}
