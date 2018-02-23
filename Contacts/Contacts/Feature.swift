// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import FeaturesKit

public final class FeatureDelegate: FeaturesKit.FeatureDelegate {
  public init() {}
}

public final class Feature: FeaturesKit.Feature {}

extension Feature: StoryboardRepresentable {
  public static var storyboard: UIStoryboard? {
    return UIStoryboard(name: "Main", bundle: Bundle(for: self))
  }
}

