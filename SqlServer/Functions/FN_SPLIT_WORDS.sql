
CREATE FUNCTION dbo.[FN_SPLIT_WORDS](@text VARCHAR(MAX), @delimiter VARCHAR(MAX) = ';') 
   RETURNS @words TABLE (
      pos INT, 
      val VARCHAR(MAX)
   ) 
AS 
BEGIN 
 
   DECLARE @pos INT, @i INT, @s VARCHAR(8000)
 
   SET @pos = 1 
 
   WHILE @pos < LEN(@text) 
      AND CHARINDEX(SUBSTRING(@text, @pos, 1), @delimiter) > 0 
      SET @pos = @pos + 1 
 
   WHILE @pos <= LEN(@text) 
   BEGIN 
      SET @i = PATINDEX('%[' + @delimiter + ']%', 
         SUBSTRING(@text, @pos, len(@text) - @pos + 1)) 
      IF @i > 0 
      BEGIN 
         SET @i = @i + @pos - 1 
         IF @i > @pos 
         BEGIN 
            -- @i now holds the earliest delimiter in the string
            SET @s = SUBSTRING(@text, @pos, @i - @pos)
            INSERT INTO @words 
            VALUES (@pos, @s)
         END 
         SET @pos = @i + 1 
 
         WHILE @pos < LEN(@text) 
            AND CHARINDEX(SUBSTRING(@text, @pos, 1), @delimiter) > 0 
            SET @pos = @pos + 1 
      END
      ELSE 
      BEGIN
         SET @s = SUBSTRING(@text, @pos, LEN(@text) - @pos + 1)
         INSERT INTO @words 
         VALUES (@pos, @s) SET @pos = LEN(@text) + 1
      END 
   END
   RETURN 
END 
