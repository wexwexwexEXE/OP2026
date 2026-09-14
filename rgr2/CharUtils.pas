UNIT CharUtils;

INTERFACE
  CONST
    CapitalLetters = ['А', 'Б', 'В', 'Г', 'Д', 'Е', 'Ё', 'Ж', 'З', 'И', 'Й', 'К', 'Л', 'М', 'Н', 'О', 'П', 'Р', 'С', 'Т', 'У', 'Ф', 'Х', 'Ц', 'Ч', 'Ш', 'Щ', 'Ъ', 'Ы', 'Ь', 'Э', 'Ю', 'Я', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];

  PROCEDURE ChangeOfCase(VAR Ch: CHAR);
  FUNCTION Letter(C: CHAR): BOOLEAN;
  FUNCTION Digit(C: CHAR): BOOLEAN;
  FUNCTION ThisLetter(C: CHAR): BOOLEAN;

IMPLEMENTATION
  {уменьшение буквы}
  PROCEDURE ChangeOfCase(VAR Ch: CHAR);
  BEGIN
    IF (Ch IN CapitalLetters) THEN
      CASE Ch OF
        'A': Ch := 'a'; 
		'B': Ch := 'b'; 
		'C': Ch := 'c'; 
		'D': Ch := 'd'; 
		'E': Ch := 'e';
        'F': Ch := 'f'; 
		'G': Ch := 'g'; 
		'H': Ch := 'h'; 
		'I': Ch := 'i'; 
		'J': Ch := 'j';
        'K': Ch := 'k'; 
		'L': Ch := 'l'; 
		'M': Ch := 'm'; 
		'N': Ch := 'n'; 
		'O': Ch := 'o';
        'P': Ch := 'p'; 
		'Q': Ch := 'q'; 
		'R': Ch := 'r'; 
		'S': Ch := 's'; 
		'T': Ch := 't';
        'U': Ch := 'u'; 
		'V': Ch := 'v'; 
		'W': Ch := 'w'; 
		'X': Ch := 'x'; 
		'Y': Ch := 'y';
        'Z': Ch := 'z';
        'А': Ch := 'а'; 
		'Б': Ch := 'б'; 
		'В': Ch := 'в'; 
		'Г': Ch := 'г'; 
		'Д': Ch := 'д';
        'Е': Ch := 'е'; 
		'Ё': Ch := 'ё'; 
		'Ж': Ch := 'ж'; 
		'З': Ch := 'з'; 
		'И': Ch := 'и';
        'Й': Ch := 'й'; 
		'К': Ch := 'к'; 
		'Л': Ch := 'л'; 
		'М': Ch := 'м'; 
		'Н': Ch := 'н';
        'О': Ch := 'о'; 
		'П': Ch := 'п'; 
		'Р': Ch := 'р'; 
		'С': Ch := 'с'; 
		'Т': Ch := 'т';
        'У': Ch := 'у'; 
		'Ф': Ch := 'ф'; 
		'Х': Ch := 'х'; 
		'Ц': Ch := 'ц'; 
		'Ч': Ch := 'ч';
        'Ш': Ch := 'ш'; 
		'Щ': Ch := 'щ'; 
		'Ъ': Ch := 'ъ'; 
		'Ы': Ch := 'ы'; 
		'Ь': Ch := 'ь';
        'Э': Ch := 'э'; 
		'Ю': Ch := 'ю'; 
		'Я': Ch := 'я'
      END
  END;

  {проверка на то что символ буква}
  FUNCTION Letter(C: CHAR): BOOLEAN;
  BEGIN
    Letter := ((C >= 'a') AND (C <= 'z')) OR ((C >= 'A') AND (C <= 'Z')) OR ((C >= 'а') AND (C <= 'я')) OR ((C >= 'А') AND (C <= 'Я'))
  END;
  
  {проверка на цифру}
  FUNCTION Digit(C: CHAR): BOOLEAN;
  BEGIN
    Digit := (C >= '0') AND (C <= '9')
  END;
  
  {избавление от всех прочих символов}
  FUNCTION ThisLetter(C: CHAR): BOOLEAN;
  BEGIN
    ThisLetter := NOT Letter(C) AND NOT Digit(C) AND (C <> '-')
  END;

END.
