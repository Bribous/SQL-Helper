
CREATE OR ALTER FUNCTION [dbo].[FN_GET_FIRST_NAME]
 (
 @Resultado VARCHAR(8000)
 )
 RETURNS VARCHAR(8000)
 AS
 BEGIN

	IF @Resultado LIKE '% %'
		BEGIN
			SET @Resultado = (SUBSTRING(LTRIM(RTRIM(@Resultado)), 1 ,CHARINDEX(' ', LTRIM(RTRIM(@Resultado))) -1))
		END
	
    RETURN @Resultado
 END




