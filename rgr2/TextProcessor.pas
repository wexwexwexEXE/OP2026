UNIT TextProcessor;

INTERFACE
  USES WordTree;

  PROCEDURE ExtractWords(VAR FileIn: TEXT; VAR Root: Tree);

IMPLEMENTATION
  USES CharUtils;
  PROCEDURE ExtractWords(VAR FileIn: TEXT; VAR Root: Tree);
  VAR
    Ch, PrevCh: CHAR;
    Word: STRING;
    Number: BOOLEAN;
  BEGIN
    Word := '';
    PrevCh := ' ';
    Number := FALSE;

    WHILE NOT EOF(FileIn)
    DO
      BEGIN
        READ(FileIn, Ch);
        IF Digit(Ch)
        THEN
          BEGIN
            Number := TRUE;
            IF Word <> ''
            THEN
              BEGIN
                Insert(Root, Word);
                Word := '';
              END;
          END
        ELSE
          BEGIN
            IF Number AND (ThisLetter(Ch) OR (Ch = '-'))
            THEN
              Number := FALSE;

            IF Letter(Ch) AND NOT Number
            THEN
              BEGIN
                ChangeOfCase(Ch);
                Word := Word + Ch;
              END
            ELSE
              IF Ch = '-'
              THEN
                BEGIN
                  IF (Word <> '') AND Letter(PrevCh)
                  THEN
                    Word := Word + Ch
                  ELSE
                    BEGIN
                      IF Word <> ''
                      THEN
                        BEGIN
                          Insert(Root, Word);
                          Word := '';
                        END;
                    END;
                END
              ELSE
                IF ThisLetter(Ch) AND (Word <> '')
                THEN
                  BEGIN
                    Insert(Root, Word);
                    Word := '';
                  END;
          END;

        PrevCh := Ch;
      END;

    IF (Word <> '') AND NOT Number
    THEN
      Insert(Root, Word);
  END;

END.
