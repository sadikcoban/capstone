CREATE TABLE IF NOT EXISTS rezervation.rezervations (
  id INT NOT NULL AUTO_INCREMENT,
  start REAL NOT NULL,
  end REAL NOT NULL,
  price_calculated REAL NOT NULL,
  coupon_id INT,
  net_price REAL NOT NULL,
  vehicle_id INT,
  status ENUM("waiting", "in_lot", "expired", "canceled", "done"),

  FOREIGN KEY coupon_id REFERENCES coupons(id),
  FOREIGN KEY vehicle_id REFERENCES vehicles(id),
  PRIMARY KEY (id),)
ENGINE = InnoDB;