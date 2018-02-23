// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import FeaturesKit

protocol ApplicationCoordinatorDelegate: CoordinatorDelegate {

}

final class ApplicationCoordinator: Coordinator {
  weak var delegate: ApplicationCoordinatorDelegate?

  var rootViewController: UIViewController?
  lazy var featuresCoordinator = FeaturesCoordinator()
}
