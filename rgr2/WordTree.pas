UNIT WordTree;{бинарное дерево} 

INTERFACE
  TYPE
    Tree = ^Node;
    Node = RECORD
      Data: STRING;
      Count: INTEGER;
      LLink, RLink: Tree;
    END;

  PROCEDURE Insert(VAR Ptr: Tree; Data: STRING);
  PROCEDURE PrintTree(VAR OutputFile: TEXT; Ptr: Tree);

IMPLEMENTATION
  PROCEDURE Insert(VAR Ptr: Tree; Data: STRING);
  BEGIN																	
    IF Ptr = NIL 
	THEN
      BEGIN
        NEW(Ptr);
        Ptr^.Data := Data;
        Ptr^.Count := 1;
        Ptr^.LLink := NIL;
        Ptr^.RLink := NIL
      END
    ELSE
      IF Data < Ptr^.Data 
	  THEN
        Insert(Ptr^.LLink, Data)
      ELSE 
	    IF Data > Ptr^.Data 
	    THEN
          Insert(Ptr^.RLink, Data)
        ELSE
          Ptr^.Count := Ptr^.Count + 1
  END;

  PROCEDURE PrintTree(VAR OutputFile: TEXT; Ptr: Tree);
  BEGIN
    IF Ptr <> NIL 
	THEN
      BEGIN
        PrintTree(OutputFile, Ptr^.LLink);
        WRITELN(OutputFile, Ptr^.Data, ' ', Ptr^.Count);
        PrintTree(OutputFile, Ptr^.RLink)
      END
    END;

END.
