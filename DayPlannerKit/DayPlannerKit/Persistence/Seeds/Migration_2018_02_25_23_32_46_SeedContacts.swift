// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import SQLiteMigrationManager
import SQLite

struct Migration_2018_02_25_23_32_46_SeedContacts: Migration {
  var version: Int64 = 2018_02_25_23_32_46

  func migrateDatabase(_ db: Connection) throws {
    var contact = Contact.init()
    contact.name = "John Citizen"
    contact.address = "123 A Street"
    contact.phone = "555.555.5555"

    try db.run(Contact.table.insert(contact))
  }
}
