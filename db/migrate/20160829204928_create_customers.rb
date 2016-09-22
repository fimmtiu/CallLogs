class CreateCustomers < ActiveRecord::Migration
  def up
    execute(<<-SQL
      CREATE TABLE "customers" (
        "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        "name" VARCHAR DEFAULT '' NOT NULL,
        "email" VARCHAR DEFAULT '' NOT NULL,
        "account_type" VARCHAR,
        "created_at" DATETIME,
        "updated_at" DATETIME
      )
      SQL
    )
  end

  def down
    execute('DROP TABLE "customers"')
  end
end
