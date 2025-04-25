
  ---Queries for table exported from dbdiagram.oi
  
CREATE TABLE `user` (
  `user_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `email` varchar(255) UNIQUE,
  `password` varchar(255),
  `address` text,
  `created_at` timestamp
 
);

CREATE TABLE `order` (
  `order_id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `order_date` datetime,
  `status` varchar(255),
  `total_amount` decimal,
  `shipping_address` text
);

CREATE TABLE order_item (
  order_item_id int PRIMARY KEY AUTO_INCREMENT,
  `order_id` int,
  `product_item_id` int,
  `quantity` int,
  `price_purchased` decimal
);

CREATE TABLE `product_image` (
  `image_id` int PRIMARY KEY AUTO_INCREMENT,
  `product_item_id` int,
  `image_url` varchar(255)
);

CREATE TABLE `color` (
  `color_id` int PRIMARY KEY AUTO_INCREMENT,
  `color_name` varchar(255),
  `hex_value` varchar(255)
);

CREATE TABLE `product_category` (
  `category_id` int PRIMARY KEY AUTO_INCREMENT,
  `category_name` varchar(255),
  `parent_category_id` int
);

CREATE TABLE `brand` (
  `brand_id` int PRIMARY KEY AUTO_INCREMENT,
  `brand_name` varchar(255),
  `brand_description` text
);

CREATE TABLE `product` (
  `product_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `description` text,
  `brand_id` int,
  `category_id` int,
  `created_at` datetime
);

CREATE TABLE `product_item` (
  `product_item_id` int PRIMARY KEY AUTO_INCREMENT,
  `product_id` int,
  `sku` varchar(255),
  `price` decimal,
  `stock_quantity` int
);

CREATE TABLE `product_variation` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `product_id` int,
  `color_id` int,
  `size_option_id` int
);

CREATE TABLE `size_category` (
  `size_category_id` int PRIMARY KEY AUTO_INCREMENT,
  `category_name` varchar(255),
  `description` text
);

CREATE TABLE `size_option` (
  `size_option_id` int PRIMARY KEY,
  `size_category_id` int,
  `size_label` VARCHAR
);

CREATE TABLE `attribute_category` (
  `attribute_category_id` int PRIMARY KEY AUTO_INCREMENT,
  `category_name` varchar(255)
);

CREATE TABLE `attribute_type` (
  `attribute_type_id` int PRIMARY KEY AUTO_INCREMENT,
  `attribute_category_id` int,
  `attribute_name` varchar(255)
);

CREATE TABLE `product_attribute` (
  `product_attribute_id` int PRIMARY KEY AUTO_INCREMENT,
  `product_item_id` int,
  `attribute_type_id` int
);

ALTER TABLE `order` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `order_item` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`);

ALTER TABLE `order_item` ADD FOREIGN KEY (`product_item_id`) REFERENCES `product_item` (`product_item_id`);

ALTER TABLE `product_image` ADD FOREIGN KEY (`product_item_id`) REFERENCES `product_item` (`product_item_id`);

ALTER TABLE `product_category` ADD FOREIGN KEY (`parent_category_id`) REFERENCES `product_category` (`category_id`);

ALTER TABLE `product` ADD FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`);

ALTER TABLE `product` ADD FOREIGN KEY (`category_id`) REFERENCES `product_category` (`category_id`);

ALTER TABLE `product_item` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

ALTER TABLE `product_variation` ADD FOREIGN KEY (`product_id`) REFERENCES `product_item` (`product_item_id`);

ALTER TABLE `product_variation` ADD FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`);

ALTER TABLE `product_variation` ADD FOREIGN KEY (`size_option_id`) REFERENCES `size_option` (`size_option_id`);

ALTER TABLE `size_option` ADD FOREIGN KEY (`size_category_id`) REFERENCES `size_category` (`size_category_id`);

ALTER TABLE `attribute_type` ADD FOREIGN KEY (`attribute_category_id`) REFERENCES `attribute_category` (`attribute_category_id`);

ALTER TABLE `product_attribute` ADD FOREIGN KEY (`product_item_id`) REFERENCES `product_item` (`product_id`);

ALTER TABLE `product_attribute` ADD FOREIGN KEY (`attribute_type_id`) REFERENCES `attribute_type` (`attribute_type_id`);
