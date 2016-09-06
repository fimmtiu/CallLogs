class CreateCustomers < ActiveRecord::Migration
  def up
    execute(<<-SQL
      CREATE TABLE "customers" (
        "id" SERIAL PRIMARY KEY NOT NULL,
        "name" VARCHAR DEFAULT '' NOT NULL,
        "email" VARCHAR DEFAULT '' NOT NULL,
        "account_type" VARCHAR,
        "created_at" TIMESTAMP,
        "updated_at" TIMESTAMP
      )
      SQL
    )
  end

  def down
    execute('DROP TABLE "customers"')
  end
end
