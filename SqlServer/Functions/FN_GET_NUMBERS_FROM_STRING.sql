
CREATE OR ALTER FUNCTION dbo.FN_GET_NUMBERS_FROM_STRING(@strAlphaNumeric VARCHAR(max))
RETURNS VARCHAR(256)
AS
BEGIN
    DECLARE @intAlpha INT
    SET @intAlpha = PATINDEX('%[^0-9]%', @strAlphaNumeric)
BEGIN
    WHILE @intAlpha > 0
    BEGIN
        SET @strAlphaNumeric = STUFF(@strAlphaNumeric, @intAlpha, 1, '' )
        SET @intAlpha = PATINDEX('%[^0-9]%', @strAlphaNumeric )
    END
END

RETURN ISNULL(@strAlphaNumeric,0)

END
GO