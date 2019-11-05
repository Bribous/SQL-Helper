
CREATE OR ALTER FUNCTION [dbo].[FN_GET_LAST_NAME]
 (
 @Resultado VARCHAR(8000)
 )
 RETURNS VARCHAR(8000)
 AS
 BEGIN
    SET @Resultado = TRIM(@Resultado)
    IF @Resultado LIKE '% %'
		BEGIN
			SET @Resultado = (RIGHT(@Resultado, CHARINDEX(' ',REVERSE(LTRIM(RTRIM(@Resultado))))-1))
		END
    RETURN @Resultado
 END



