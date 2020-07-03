CREATE SCHEMA store;

CREATE TABLE store.products ( product_id SERIAL PRIMARY KEY
			    , product_name VARCHAR(255) NOT NULL
			    , price DECIMAL (10, 2) NOT NULL
		            );

CREATE TABLE store.customers ( customer_id SERIAL PRIMARY KEY
			     , first_name VARCHAR(255) NOT NULL 
			     , last_name VARCHAR(255) NOT NULL
			     );

CREATE TABLE store.orders ( order_id SERIAL PRIMARY KEY
			  , customer_id INTEGER
			  , FOREIGN KEY(customer_id) REFERENCES store.customers(customer_id) ON DELETE CASCADE ON UPDATE CASCADE
		          );

CREATE TABLE store.order_items ( order_id INTEGER
			       , item_id INTEGER
			       , product_id INTEGER NOT NULL
			       , quantity INTEGER NOT NULL
			       , PRIMARY KEY (order_id, item_id)
			       , FOREIGN KEY (order_id) REFERENCES store.orders (order_id) ON DELETE CASCADE ON UPDATE CASCADE
			       , FOREIGN KEY (product_id) REFERENCES store.products (product_id) ON DELETE CASCADE ON UPDATE CASCADE
			       );
