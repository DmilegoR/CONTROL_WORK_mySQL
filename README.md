# CONTROL_WORK_mySQL

Базы данных и SQL (семинары)
Урок 6. SQL – Транзакции. Временные таблицы, управляющие конструкции, циклы
Сдавать ссылкой на свой репозиторий в Гитхабе, иначе НЕ СДАНО. Нужен только код SQL.

1.Создайте функцию, которая принимает кол-во сек и далее переводит их в кол-во дней, часов, минут, секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

delimiter //
CREATE FUNCTION convert_seconds(INPUT_SECONDS INT) RETURNS VARCHAR(255)
deterministic
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE seconds INT;

    -- Calculate days, hours, minutes, and seconds
    SET days = FLOOR(INPUT_SECONDS / 86400);
    SET hours = FLOOR((INPUT_SECONDS % 86400) / 3600);
    SET minutes = FLOOR((INPUT_SECONDS % 3600) / 60);
    SET seconds = INPUT_SECONDS % 60;

    -- Return the formatted result
    RETURN CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
END //

delimiter ;

SELECT convert_seconds(123456);

2.Cоздайте процедуру, которая выведет только числа, делящиеся на 15 или 33 в промежутке от 1 до 1000.
Пример: 15,30,33,45...

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
