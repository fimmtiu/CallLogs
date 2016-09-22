class CreateLogs < ActiveRecord::Migration
  def up
    execute(<<-SQL
      CREATE TABLE "logs" (
        "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        "user_id" INTEGER,
        "customer_id" INTEGER,
        "notes" TEXT,
        "duration" INTEGER,
        "created_at" DATETIME,
        "updated_at" DATETIME
      )
      SQL
    )

    execute('CREATE INDEX "index_logs_on_customer_id" ON "logs" ("customer_id")')
    execute('CREATE INDEX "index_logs_on_user_id_and_created_at" ON "logs" ("user_id", "created_at")')
  end

  def down
    execute('DROP TABLE "logs"')
  end
end
