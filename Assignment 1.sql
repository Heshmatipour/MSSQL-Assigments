CREATE TABLE Product (
prod_id INT,
prod_name VARCHAR(50),
quantity INT,
PRIMARY KEY(prod_id)
);

CREATE TABLE Component (
comp_id INT,
comp_name VARCHAR(50),
description_ VARCHAR(50),
quantity_comp INT,
PRIMARY KEY (comp_id)
);

CREATE TABLE Prod_Comp (

prod_id INT,
comp_id INT,
FOREIGN KEY (prod_id) REFERENCES Product(prod_id),
FOREIGN KEY (comp_id) REFERENCES Component(comp_id),
PRIMARY KEY (prod_id, comp_id),
quantity_comp INT
);

CREATE TABLE Supplier (
supp_id INT PRIMARY KEY,
supp_name VARCHAR(50),
supp_location VARCHAR(50),
supp_country VARCHAR(50),
is_active BIT
);

CREATE TABLE Comp_Supp (

supp_id INT,
comp_id INT,
FOREIGN KEY (supp_id) REFERENCES Supplier(supp_id),
FOREIGN KEY (comp_id) REFERENCES Component(comp_id),
PRIMARY KEY (supp_id, comp_id),
order_date DATE,
quantity INT
);