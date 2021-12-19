CREATE TABLE IF NOT EXISTS rezervation.coupons (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  explanation VARCHAR(250) NOT NULL,
  discount_rate REAL NOT NULL,
  user_id INT,

  FOREIGN KEY user_id REFERENCES users(id)
  PRIMARY KEY (ID))
ENGINE = InnoDB;