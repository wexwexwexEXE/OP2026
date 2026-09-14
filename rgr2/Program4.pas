PROGRAM CombinedProgram;

USES WordTree, TextProcessor;

CONST
  InputFile  = 'input2.txt';
  OutputFile = 'output.txt';

VAR
  FileIn, FileOut: TEXT;
  Root: Tree;

BEGIN
  Root := NIL;

  ASSIGN(FileIn, InputFile);
  RESET(FileIn);
  ExtractWords(FileIn, Root);
  CLOSE(FileIn);

  ASSIGN(FileOut, OutputFile);
  REWRITE(FileOut);
  PrintTree(FileOut, Root);
  CLOSE(FileOut);
END.
