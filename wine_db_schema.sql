-- Database: wine_review_db

-- DROP DATABASE wine_review_db;

CREATE DATABASE wine_review_db
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
-- CREATE TABLES

CREATE TABLE IF NOT EXISTS "winery" (
    "winery_id" int   NOT NULL,
    "winery_name" varchar(100)   NOT NULL,
    CONSTRAINT "pk_winery" PRIMARY KEY (
        "winery_id"
     )
);

CREATE TABLE IF NOT EXISTS "taster" (
    "taster_id" int   NULL,
    "taster_name" varchar(50)   NULL,
    "taster_twitter" varchar(50)   NULL,
    CONSTRAINT "pk_taster" PRIMARY KEY (
        "taster_id"
     )
);

CREATE TABLE IF NOT EXISTS "wine_review" (
    "wine_review_id" int   NOT NULL,
    "wine_name" varchar(200)   NULL,
    "wine_year" int   NULL,
    "wine_price" decimal(10,2)   NULL,
    "wine_score" int   NULL,
    "grape_id" int   NOT NULL,
    "region_id" int   NOT NULL,
    "taster_id" int   NOT NULL,
    "winery_id" int   NOT NULL,
    CONSTRAINT "pk_wine_review" PRIMARY KEY (
        "wine_review_id"
     )
);

CREATE TABLE IF NOT EXISTS "region" (
    "region_id" int   NOT NULL,
    "province" varchar(50)   NULL,
    "region1" varchar(50)   NULL,
    "region2" varchar(50)   NULL,
    "combined_region" varchar(200)   NOT NULL,
    "latitude" decimal(8,6)   NULL,
    "longitude" decimal(9,6)   NULL,
    "country_id" int   NOT NULL,
    CONSTRAINT "pk_region" PRIMARY KEY (
        "region_id"
     )
);

CREATE TABLE IF NOT EXISTS "country" (
    "country_id" int   NOT NULL,
    "country_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_country" PRIMARY KEY (
        "country_id"
     )
);

CREATE TABLE IF NOT EXISTS "grape_variety" (
    "grape_id" int   NOT NULL,
    "grape_name" varchar(50)   NULL,
    "grape_color" varchar(15)   NULL,
    CONSTRAINT "pk_grape_variety" PRIMARY KEY (
        "grape_id"
     )
);

ALTER TABLE "wine_review" ADD CONSTRAINT "fk_wine_review_grape_id" FOREIGN KEY("grape_id")
REFERENCES "grape_variety" ("grape_id");

ALTER TABLE "wine_review" ADD CONSTRAINT "fk_wine_review_region_id" FOREIGN KEY("region_id")
REFERENCES "region" ("region_id");

ALTER TABLE "wine_review" ADD CONSTRAINT "fk_wine_review_taster_id" FOREIGN KEY("taster_id")
REFERENCES "taster" ("taster_id");

ALTER TABLE "wine_review" ADD CONSTRAINT "fk_wine_review_winery_id" FOREIGN KEY("winery_id")
REFERENCES "winery" ("winery_id");

ALTER TABLE "region" ADD CONSTRAINT "fk_region_country_id" FOREIGN KEY("country_id")
REFERENCES "country" ("country_id");





