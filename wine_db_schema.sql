-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "country" (
    "country_id" int   NOT NULL,
    "country_name" varchar(30)   NOT NULL,
    CONSTRAINT "pk_country" PRIMARY KEY (
        "country_id"
     )
);

CREATE TABLE "grape_variety" (
    "grape_id" int   NOT NULL,
    "grape_name" varchar(30)   NOT NULL,
    "grape_color" varchar(30)   NOT NULL,
    CONSTRAINT "pk_grape_variety" PRIMARY KEY (
        "grape_id"
     )
);

CREATE TABLE "region" (
    "region_id" int   NOT NULL,
    "province" varchar(30)   NOT NULL,
    "region1" varchar(30)   NOT NULL,
    "region2" varchar(30)   NOT NULL,
    "combined_region" varchar(100)   NOT NULL,
    "latitude" decimal(8,6)   NOT NULL,
    "longitude" decimal(9,6)   NOT NULL,
    "country_id" int   NOT NULL,
    CONSTRAINT "pk_region" PRIMARY KEY (
        "region_id"
     )
);

CREATE TABLE "wine_review" (
    "wine_id" int   NOT NULL,
    "wine_name" varchar(50)   NOT NULL,
    "wine_year" int   NOT NULL,
    "wine_price" decimal(10,2)   NOT NULL,
    "wine_score" int   NOT NULL,
    "grape_id" int   NOT NULL,
    "region_id" int   NOT NULL,
    "taster_id" int   NOT NULL,
    "winery_id" int   NOT NULL,
    CONSTRAINT "pk_wine_review" PRIMARY KEY (
        "wine_id"
     )
);

CREATE TABLE "taster" (
    "taster_id" int   NOT NULL,
    "taster_name" varchar(30)   NOT NULL,
    "taster_twitter" varchar(30)   NOT NULL,
    CONSTRAINT "pk_taster" PRIMARY KEY (
        "taster_id"
     )
);

CREATE TABLE "winery" (
    "winery_id" int   NOT NULL,
    "winery_name" varchar(30)   NOT NULL,
    CONSTRAINT "pk_winery" PRIMARY KEY (
        "winery_id"
     )
);

ALTER TABLE "region" ADD CONSTRAINT "fk_region_country_id" FOREIGN KEY("country_id")
REFERENCES "country" ("country_id");

ALTER TABLE "wine_review" ADD CONSTRAINT "fk_wine_review_grape_id" FOREIGN KEY("grape_id")
REFERENCES "grape_variety" ("grape_id");

ALTER TABLE "wine_review" ADD CONSTRAINT "fk_wine_review_region_id" FOREIGN KEY("region_id")
REFERENCES "region" ("region_id");

ALTER TABLE "wine_review" ADD CONSTRAINT "fk_wine_review_taster_id" FOREIGN KEY("taster_id")
REFERENCES "taster" ("taster_id");

ALTER TABLE "wine_review" ADD CONSTRAINT "fk_wine_review_winery_id" FOREIGN KEY("winery_id")
REFERENCES "winery" ("winery_id");

