class CreateLogs < ActiveRecord::Migration
  def up
    execute(<<-SQL
      CREATE TABLE "logs" (
        "id" SERIAL PRIMARY KEY NOT NULL,
        "user_id" INTEGER,
        "customer_id" INTEGER,
        "summary" TEXT,
        "duration" INTEGER,
        "created_at" TIMESTAMP,
        "updated_at" TIMESTAMP
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
