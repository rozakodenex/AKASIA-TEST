CREATE PROCEDURE InvertValue
    @Id INT,
    @Column CHAR(1)
AS
BEGIN
    -- Check if the column parameter is valid
    IF @Column NOT IN ('A', 'B', 'C', 'D', 'E')
    BEGIN
        RAISERROR('Invalid column parameter', 16, 1)
        RETURN
    END

    -- Update the specified column for the matching rows
    UPDATE #TEST2
    SET
        [A] = CASE WHEN @Column = 'A' AND [A] IS NOT NULL THEN ~[A] ELSE [A] END,
        [B] = CASE WHEN @Column = 'B' AND [B] IS NOT NULL THEN ~[B] ELSE [B] END,
        [C] = CASE WHEN @Column = 'C' AND [C] IS NOT NULL THEN ~[C] ELSE [C] END,
        [D] = CASE WHEN @Column = 'D' AND [D] IS NOT NULL THEN ~[D] ELSE [D] END,
        [E] = CASE WHEN @Column = 'E' AND [E] IS NOT NULL THEN ~[E] ELSE [E] END
    WHERE [Id] = @Id
END


/*** 

This stored procedure accepts two input parameters, @Id and @Column, which are used to identify the rows to be updated and the column to be inverted, respectively. The procedure first checks if the @Column parameter is valid (i.e., one of 'A', 'B', 'C', 'D', or 'E'). If the parameter is not valid, the procedure raises an error and returns.

The procedure then uses an UPDATE statement to update the specified column for the matching rows in the #TEST2 table. The CASE statement is used to invert the value of the column only if the existing value is not NULL. The tilde (~) operator is used to invert the value of the bit column.

Note that this implementation assumes that the Id column in the #TEST2 table is a primary key, or at least has a unique index on it. If this is not the case, the UPDATE statement may update multiple rows, which may not be the desired behavior.

***/
