CREATE TABLE "customers" (
  "id" SERIAL PRIMARY KEY,
  "name" text NOT NULL,
  "cpf" int NOT NULL,
  "address" text NOT NULL
);

CREATE TABLE "agencies" (
  "id" SERIAL PRIMARY KEY,
  "manager" text NOT NULL,
  "employees" text,
  "type" text,
  "orders_id" int
);

CREATE TABLE "address" (
  "id" SERIAL PRIMARY KEY,
  "street" text NOT NULL,
  "district" text NOT NULL,
  "number" int,
  "agencies_id" int
);

CREATE TABLE "cars" (
  "id" SERIAL PRIMARY KEY,
  "color" text NOT NULL,
  "plate" text,
  "direction" text NOT NULL,
  "models_id" int NOT NULL
);

CREATE TABLE "models" (
  "id" SERIAL PRIMARY KEY,
  "brand" text NOT NULL,
  "model" text NOT NULL
);

CREATE TABLE "orders" (
  "id" SERIAL PRIMARY KEY,
  "data" datetime,
  "customers_id" int NOT NULL,
  "agencies_id" int NOT NULL,
  "cars_id" int NOT NULL
);

CREATE TABLE "orders_cars" (
  "id" SERIAL PRIMARY KEY,
  "cars_id" int,
  "order_id" int
);

ALTER TABLE "address" ADD FOREIGN KEY ("agencies_id") REFERENCES "agencies" ("id");

ALTER TABLE "cars" ADD FOREIGN KEY ("models_id") REFERENCES "models" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("customers_id") REFERENCES "customers" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("agencies_id") REFERENCES "agencies" ("id");

ALTER TABLE "orders_cars" ADD FOREIGN KEY ("order_id") REFERENCES "cars" ("id");

ALTER TABLE "orders_cars" ADD FOREIGN KEY ("cars_id") REFERENCES "orders" ("id");
