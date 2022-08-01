CREATE TABLE "states" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL
)

CREATE TABLE "cities" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT,
	"stateId" INTEGER NOT NULL REFERENCES "states"("id")
)

CREATE TABLE "customers"(
	"id" SERIAL PRIMARY KEY,
	"fullName" TEXT NOT NULL,
	"cpf" TEXT NOT NULL UNIQUE,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL
)

CREATE TABLE "customerAdress" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
	"street" TEXT NOT NULL,
	"number" INTEGER NOT NULL,
	"complement" TEXT NOT NULL,
	"postalCode" TEXT NOT NULL,
	"cityId" INTEGER NOT NULL REFERENCES "cities"("id")
)

CREATE TABLE "customerPhones" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
	"number" TEXT NOT NULL,
	"type" TEXT NOT NULL
)

CREATE TABLE "bankAccount"(
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
	"accountNumber" TEXT NOT NULL,
	"agency" TEXT NOT NULL,
	"openDate" DATE NOT NULL,
	"closeDate" DATE NOT NULL
)

CREATE TABLE "transactions"(
	"id" SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
	"amout" INTEGER NOT NULL,
	"type" TEXT NOT NULL,
	"time" TIME NOT NULL,
	"description" TEXT NOT NULL,
	"cancelled" BOOLEAN NOT NULL DEFAULT FALSE	
)

CREATE TABLE "creditCard"(
	"id" SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
	"name" TEXT NOT NULL,
	"number" TEXT NOT NULL,
	"securityCode" TEXT NOT NULL,
	"expirationMonth" TEXT NOT NULL,
	"expirationYear" TEXT NOT NULL,
	"password" TEXT NOT NULL,
	"limit" INTEGER NOT NULL
);
