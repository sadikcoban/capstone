CREATE TABLE IF NOT EXISTS rezervation.vehicles (
  id INT NOT NULL AUTO_INCREMENT,
  plate VARCHAR(50) NOT NULL,
  user_id INT,
  PRIMARY KEY (ID),
  FOREIGN KEY (user_id) REFERENCES users(id))
ENGINE = InnoDB;