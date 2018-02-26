// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation

public struct Appointment: Codable, TimeStampable {
  public var id: Int?
  public var createdAt: Date?
  public var updatedAt: Date?
  public var deletedAt: Date?

  public var contacts = [Contact]()
  public var startDate: Date?
  public var endDate: Date?
}

extension Appointment: SQLitePersistable {
  public typealias Storage = SQLiteDatabase
}


struct AppointmentContacts: Codable {
  public var id: Int?
  public var createdAt: Date?
  public var updatedAt: Date?
  public var deletedAt: Date?
}

extension AppointmentContacts: SQLitePersistable {
  public typealias Storage = SQLiteDatabase

  static var tableName: String {
    return "appointment_contacts"
  }
}

