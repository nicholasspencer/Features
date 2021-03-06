import Foundation
import SQLiteMigrationManager
import SQLite

struct Migration_2018_02_24_09_26_52_CreateTables: Migration {
  var version: Int64 = 2018_02_24_09_26_52

  func migrateDatabase(_ db: Connection) throws {
    let id = Expression<Int64>("id")

    try db.run(Contact.table.create(ifNotExists: true) { t in
      t.column(id, primaryKey: .autoincrement)
      t.column(Expression<String>("name"))
      t.column(Expression<String?>("address"))
      t.column(Expression<String?>("phone"))
      t.column(Expression<Date?>("createdAt"))
      t.column(Expression<Date?>("updatedAt"))
      t.column(Expression<Date?>("deletedAt"))
      t.column(Expression<Bool>("favorite"), defaultValue: false)
    })

    try db.run(Appointment.table.create(ifNotExists: true) { t in
      t.column(id, primaryKey: .autoincrement)
      t.column(Expression<Date?>("createdAt"))
      t.column(Expression<Date?>("updatedAt"))
      t.column(Expression<Date?>("deletedAt"))
      t.column(Expression<Date?>("startDate"))
      t.column(Expression<Date?>("endDate"))
    })

    try db.run(AppointmentContacts.table.create(ifNotExists: true) { t in
      let appointmentId = Expression<Int64>("appointment_id")
      let contactId = Expression<Int64>("contact_id")
      t.column(Expression<String>(appointmentId))
      t.column(Expression<String>(contactId))
      t.column(Expression<Date?>("createdAt"))
      t.column(Expression<Date?>("updatedAt"))
      t.column(Expression<Date?>("deletedAt"))
      t.foreignKey(appointmentId, references: Appointment.table, id)
      t.foreignKey(contactId, references: Contact.table, id)
    })
  }
}

