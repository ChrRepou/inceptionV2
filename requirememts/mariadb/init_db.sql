CREATE DATABASE IF NOT EXISTS 'wordpress';
CREATE USER IF NOT EXISTS 'crepou'@'%' IDENTIFIED BY 'pass'
GRANT ALL PRIVILEGES ON 'wordpress'.* TO crepou@'%' IDENTIFIED BY 'pass';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'chris!123';
