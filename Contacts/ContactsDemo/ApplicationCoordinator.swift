// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import FeaturesKit

import DayPlannerKit
import Kontacts

protocol ApplicationCoordinatorDelegate: CoordinatorDelegate {}

final class ApplicationCoordinator: Coordinator {
  var coordinatorDelegate: CoordinatorDelegate?

  lazy var database: SQLiteDatabase? = {
    guard
      let database = try? SQLiteDatabase(),
      let _ = try? database.prepare()
    else { return nil }

    return database
  }()

  lazy var window: UIWindow = {
    return UIWindow(frame: UIScreen.main.bounds)
  }()

  lazy var contactsFeature: Kontacts.Feature = {
    let contactsFeature = Kontacts.Feature()
    contactsFeature.coordinatorDelegate = self
    return contactsFeature
  }()

  var rootViewController: UIViewController? {
    return self.contactsFeature.rootViewController
  }

  func presentApplication() {
    self.window.rootViewController = rootViewController
    self.window.makeKeyAndVisible()
  }
}
