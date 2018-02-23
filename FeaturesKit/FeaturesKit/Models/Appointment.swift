// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation

public struct Appointment: Codable {
  public var uuid = UUID()

  public var contacts = [Contact]()
  public var startDate: Date?
  public var endDate: Date?
}
