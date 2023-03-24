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
