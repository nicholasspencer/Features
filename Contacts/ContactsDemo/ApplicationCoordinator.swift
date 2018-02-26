// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import FeaturesKit

import DayPlannerKit
import Kontacts

protocol ApplicationCoordinatorDelegate: CoordinatorDelegate {}

final class ApplicationCoordinator: Coordinator {
  var coordinatorDelegate: CoordinatorDelegate?

  lazy var database: SQLiteDatabase? = {
    guard let database = try? SQLiteDatabase() else { return nil }

    do {
      try database.prepare()
    } catch {
      print("Database initialization and preperation failed \(error)")
    }

    return database
  }()

  lazy var window: UIWindow = {
    return UIWindow(frame: UIScreen.main.bounds)
  }()

  lazy var contactsFeature: Kontacts.Feature = {
    let contactsFeature = Kontacts.Feature()
    contactsFeature.coordinatorDelegate = self
    contactsFeature.database = self.database
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
