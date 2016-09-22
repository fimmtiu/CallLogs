CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "users" (
        "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        "name" VARCHAR DEFAULT '' NOT NULL,
        "email" VARCHAR DEFAULT '' NOT NULL,
        "encrypted_password" VARCHAR DEFAULT '' NOT NULL,
        "reset_password_token" VARCHAR,
        "reset_password_sent_at" DATETIME,
        "remember_created_at" DATETIME,
        "sign_in_count" integer DEFAULT 0 NOT NULL,
        "current_sign_in_at" DATETIME,
        "last_sign_in_at" DATETIME,
        "current_sign_in_ip" VARCHAR,
        "last_sign_in_ip" VARCHAR,
        "created_at" DATETIME,
        "updated_at" DATETIME
      );
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE TABLE "customers" (
        "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        "name" VARCHAR DEFAULT '' NOT NULL,
        "email" VARCHAR DEFAULT '' NOT NULL,
        "account_type" VARCHAR,
        "created_at" DATETIME,
        "updated_at" DATETIME
      );
CREATE TABLE "logs" (
        "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        "user_id" INTEGER,
        "customer_id" INTEGER,
        "notes" TEXT,
        "duration" INTEGER,
        "created_at" DATETIME,
        "updated_at" DATETIME
      );
CREATE INDEX "index_logs_on_customer_id" ON "logs" ("customer_id");
CREATE INDEX "index_logs_on_user_id_and_created_at" ON "logs" ("user_id", "created_at");
