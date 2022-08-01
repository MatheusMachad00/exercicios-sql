CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL UNIQUE,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" int NOT NULL,
	"productPhotos" int NOT NULL,
	"productPhotoId" TEXT NOT NULL,
	"clothingType" TEXT DEFAULT 'null',
	"clothingSize" TEXT DEFAULT 'null',
	"stock" int NOT NULL DEFAULT 'null',
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.photos" (
	"id" serial NOT NULL,
	"photo1" TEXT NOT NULL,
	"photo2" TEXT NOT NULL,
	"photo3" TEXT NOT NULL,
	"photo4" TEXT NOT NULL,
	"photo5" TEXT NOT NULL,
	CONSTRAINT "photos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.adress" (
	"id" serial NOT NULL,
	"userId" int NOT NULL,
	"cep" bigint NOT NULL,
	"street" TEXT NOT NULL,
	"state" TEXT NOT NULL,
	"number" bigint NOT NULL,
	"complement" TEXT NOT NULL,
	CONSTRAINT "adress_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.item" (
	"id" serial NOT NULL,
	"productId" int NOT NULL,
	"quantity" int NOT NULL,
	"buyerId" int NOT NULL,
	CONSTRAINT "item_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sale" (
	"id" serial NOT NULL,
	"itemId" int NOT NULL,
	"saleDate" DATE NOT NULL,
	"status" TEXT NOT NULL,
	"adress" int NOT NULL,
	CONSTRAINT "sale_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("productPhotos") REFERENCES "photos"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("productPhotoId") REFERENCES "photos"("photo1");


ALTER TABLE "adress" ADD CONSTRAINT "adress_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");

ALTER TABLE "item" ADD CONSTRAINT "item_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "item" ADD CONSTRAINT "item_fk1" FOREIGN KEY ("buyerId") REFERENCES "users"("id");

ALTER TABLE "sale" ADD CONSTRAINT "sale_fk0" FOREIGN KEY ("itemId") REFERENCES "item"("id");
ALTER TABLE "sale" ADD CONSTRAINT "sale_fk1" FOREIGN KEY ("adress") REFERENCES "adress"("id");







