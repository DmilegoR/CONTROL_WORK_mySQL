DELIMITER $$
CREATE PROCEDURE print_divisible_numbers()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE result VARCHAR(4000) DEFAULT '';

    WHILE i <= 1000 DO
        IF i % 15 = 0 OR i % 33 = 0 THEN
            SET result = CONCAT(result, i, ', ');
        END IF;
        SET i = i + 1;
    END WHILE;

    SET result = TRIM(TRAILING ',' FROM result);
    SET result = TRIM(TRAILING ' ' FROM result);

    SELECT result;
END$$
DELIMITER ;

CALL print_divisible_numbers();
