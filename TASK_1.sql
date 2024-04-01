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
