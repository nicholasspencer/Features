// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import FeaturesKit

public final class FeatureDelegate: FeaturesKit.FeatureDelegate {
  public init() {}
}

public final class Feature: FeaturesKit.Feature {}

extension Feature: IBRepresentable {
  public static var storyboardName: String? {
    return "Main"
  }
}
