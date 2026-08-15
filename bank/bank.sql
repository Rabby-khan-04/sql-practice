-- Schema
CREATE TABLE IF NOT EXISTS "accounts" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "balance" INTEGER NOT NULL CHECK("balance" >= 0),
    PRIMARY KEY("id")
);

INSERT INTO accounts ("name", "balance") VALUES ("Alice", 10), ("Bob", 20), ("Charlie", 30);