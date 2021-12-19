CREATE TABLE IF NOT EXISTS rezervation.lots (
  id INT NOT NULL AUTO_INCREMENT,
  status VARCHAR(50),
  wrong_plate VARCHAR(50),
  PRIMARY KEY (id),)
ENGINE = InnoDB;