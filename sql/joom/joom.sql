CREATE SCHEMA joom AUTHORIZATION postgres;

CREATE TABLE joom.categories (
	id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	"name" varchar NOT NULL,
	image varchar NOT NULL,
	CONSTRAINT categories_pk PRIMARY KEY (id),
	CONSTRAINT categories_unique UNIQUE (name)
);

CREATE TABLE joom.product (
	id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	"name" varchar NOT NULL,
	price int4 NOT NULL,
	ulr_image varchar NULL,
	id_categories int4 NULL,
	CONSTRAINT product_pk PRIMARY KEY (id),
	CONSTRAINT product_categories_fk FOREIGN KEY (id_categories) REFERENCES joom.categories(id)
);