CREATE TABLE IF NOT EXISTS rezervation.users (
  id VARCHAR(250) NOT NULL,
  name VARCHAR(50) NOT NULL,
  surname VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS rezervation.lots (
  id INT NOT NULL AUTO_INCREMENT,
  status VARCHAR(50),
  wrong_plate VARCHAR(50),
  PRIMARY KEY (id),)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS rezervation.vehicles (
  id VARCHAR(255) NOT NULL,
  plate VARCHAR(50) NOT NULL,
  user_id INT,
  PRIMARY KEY (ID),
  FOREIGN KEY (user_id) REFERENCES users(id))
ENGINE = InnoDB;

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

CREATE TABLE IF NOT EXISTS rezervation.coupons (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  explanation VARCHAR(250) NOT NULL,
  discount_rate REAL NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  PRIMARY KEY (ID))
ENGINE = InnoDB;

