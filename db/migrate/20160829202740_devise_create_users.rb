class DeviseCreateUsers < ActiveRecord::Migration
  def up
    execute(<<-SQL
      CREATE TABLE "users" (
        "id" SERIAL PRIMARY KEY NOT NULL,
        "name" VARCHAR DEFAULT '' NOT NULL,
        "email" VARCHAR DEFAULT '' NOT NULL,
        "encrypted_password" VARCHAR DEFAULT '' NOT NULL,
        "reset_password_token" VARCHAR,
        "reset_password_sent_at" TIMESTAMP,
        "remember_created_at" TIMESTAMP,
        "sign_in_count" integer DEFAULT 0 NOT NULL,
        "current_sign_in_at" TIMESTAMP,
        "last_sign_in_at" TIMESTAMP,
        "current_sign_in_ip" VARCHAR,
        "last_sign_in_ip" VARCHAR,
        "created_at" TIMESTAMP,
        "updated_at" TIMESTAMP
      )
      SQL
    )

    execute('CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email")')
    execute('CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token")')
  end

  def down
    execute('DROP TABLE "users"')
  end
end
