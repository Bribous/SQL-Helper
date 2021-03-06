
CREATE OR ALTER Function [dbo].[FN_REMOVE_NON_ALPHA_CHARS](@Temp VarChar(1000))
RETURNS VARCHAR(1000)
AS
BEGIN

    DECLARE @KeepValues AS VARCHAR(50)
    Set @KeepValues = '%[^a-z]%'
    WHILE PATINDEX(@KeepValues, @Temp) > 0
        SET @Temp = STUFF(@Temp, PATINDEX(@KeepValues, @Temp), 1, '')

    RETURN @Temp
END