CREATE TABLE IF NOT EXISTS rezervation.vehicles (
  id VARCHAR(255) NOT NULL,
  plate VARCHAR(50) NOT NULL,
  user_id INT,
  PRIMARY KEY (ID),
  FOREIGN KEY (user_id) REFERENCES users(id))
ENGINE = InnoDB;