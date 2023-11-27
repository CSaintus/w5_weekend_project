ALTER TABLE realcar
ADD COLUMN is_serviced BOOLEAN DEFAULT FALSE;


CREATE OR REPLACE PROCEDURE first_service()
AS $$
BEGIN
    UPDATE realcar
    SET is_serviced = TRUE
    WHERE dealercode IN (
        SELECT realcardealercode
        FROM Service
        WHERE service_Date > (current_date - interval '5 days')
    );
END;
$$ LANGUAGE plpgsql;
