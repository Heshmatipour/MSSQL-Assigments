CREATE FUNCTION dbo.Factorial (@Number int)
RETURNS INT AS
BEGIN
DECLARE @x  int
    IF @Number <= 1
        SET @x = 1
    ELSE
        SET @x = @Number * dbo.Factorial( @Number - 1 )
RETURN (@x)
END;

SELECT dbo.Factorial(5) AS Factorial;
