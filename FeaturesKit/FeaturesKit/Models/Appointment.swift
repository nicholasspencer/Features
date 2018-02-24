// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import SQLite

public struct Appointment: Codable {
  public var uuid = UUID()

  public var contacts = [Contact]()
  public var startDate: Date?
  public var endDate: Date?
}

extension Appointment: SQLitePersistable {
  public typealias Storage = SQLiteDatabase
}


struct AppointmentContacts: Codable {
  static var tableName: String {
    return "appointment_contacts"
  }
}

extension AppointmentContacts: SQLitePersistable {
  public typealias Storage = SQLiteDatabase
}

