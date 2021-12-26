CREATE TABLE IF NOT EXISTS rezervation.users (
  id VARCHAR(250) NOT NULL,
  name VARCHAR(50) NOT NULL,
  surname VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS rezervation.lots (
  id INT NOT NULL,
  status VARCHAR(250) NULL,
  wrong_plate VARCHAR(50),
  floor_name VARCHAR(50),
  lot_name VARCHAR(50),
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS rezervation.vehicles (
  id VARCHAR(255) NOT NULL,
  plate VARCHAR(50) NOT NULL,
  user_id VARCHAR(250) NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (user_id) REFERENCES users(id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS rezervation.coupons (
  id VARCHAR(250) NOT NULL,
  name VARCHAR(50) NOT NULL,
  explanation VARCHAR(250) NOT NULL,
  discount_rate REAL NOT NULL,
  user_id VARCHAR(250) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  PRIMARY KEY (ID))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS rezervation.rezervations (
  id INT NOT NULL AUTO_INCREMENT,
   user_id VARCHAR(250) NOT NULL,
  start VARCHAR(250) NOT NULL,
  end VARCHAR(250) NOT NULL,
  price_calculated REAL NOT NULL,
  coupon_id VARCHAR(250) NOT NULL,
  net_price REAL NOT NULL,
  vehicle_id VARCHAR(250) NOT NULL,
  status ENUM("waiting", "in_lot", "expired", "canceled", "done"),
  lot_id INT NOT NULL,

  FOREIGN KEY (coupon_id) REFERENCES coupons(id),
  FOREIGN KEY (vehicle_id) REFERENCES vehicles(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (lot_id) REFERENCES lots(id),
  PRIMARY KEY (id))
ENGINE = InnoDB;



