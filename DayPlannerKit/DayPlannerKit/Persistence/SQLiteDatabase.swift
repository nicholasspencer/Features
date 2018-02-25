// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import SQLite
import SQLiteMigrationManager

public final class SQLiteDatabase {
  public var connection: Connection
  fileprivate var migrator: SQLiteMigrationManager

  public init() throws {
    try self.connection = Connection()
    self.migrator = SQLiteMigrationManager(db: self.connection, migrations: SQLiteDatabase.migrations, bundle: nil)
  }

  public func prepare() throws {
    if !migrator.hasMigrationsTable() {
      try migrator.createMigrationsTable()
    }

    if migrator.needsMigration() {
      try migrator.migrateDatabase()
    }
  }
}

extension SQLiteDatabase: CustomStringConvertible {
  public var description: String {
    return "Database:\n" +
      "connection: \(connection)\n" +
      "migration state:\n" +
      "  hasMigrationsTable() \(migrator.hasMigrationsTable())\n" +
      "  currentVersion()     \(migrator.currentVersion())\n" +
      "  originVersion()      \(migrator.originVersion())\n" +
      "  appliedVersions()    \(migrator.appliedVersions())\n" +
      "  pendingMigrations()  \(migrator.pendingMigrations())\n" +
      "  needsMigration()     \(migrator.needsMigration())"
  }
}

extension SQLiteDatabase {
  fileprivate static var migrations: [Migration] {
    return [
      Migration_2018_02_24_09_26_52_CreateTables(),
    ]
  }
}
