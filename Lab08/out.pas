{Аеперяъ рейяр хг тюикю. Опенапюгсер ярпнвмше асйбш б опнохямше х мюнанпнр, х 
гюохяшбюер онксвхбьеияъ рейяр б дпсцни тюик╗╦}
PROCEDURE INPUTnAMEfILE (VAR S1,S2:STRING);//Ббнд хлем тюикнб

BEGIN
  WRITELN('eNTER THE FILE NAME');
  READLN(S1);
  WRITELN('eNTER THE NAME FILE THAT RECORDS THE RESULT');
  READLN(S2);
END;

PROCEDURE TRANSFORMATION (S1,S2:STRING);

VAR
  C:CHAR;
  X:BYTE;
  T1,T2:TEXT;
BEGIN
  ASSIGN(T1,S1);
  RESET(T1);
  ASSIGN(T2,S2);
  REWRITE(T2);
  IF FILEeXISTS(S1) THEN    //Еякх тюик ясыеярбсер
    BEGIN
      WHILE NOT EOF(T1) DO     //Опнундхляъ он тюикс
        BEGIN
          READ(T1,C);       //Вхрюел яхлбнк
          X:=ORD(C);        //Янупюмъел ецн йнд
          CASE ORD(C) OF    //Опенапюгсел йнд
            168:INC(X,16);
            184:DEC(X,16);
            65..90:INC(X,32);
            97..122:DEC(X,32);
            192..223:INC(X,32);
            224..255:DEC(X,32);
          END;
          C:=CHR(X);        //
          WRITE(T2,C);
        END;
      CLOSE(T1);
      CLOSE(T2);
    END
  ELSE
    BEGIN
      WRITELN('eRROR. nOT FOUND THE SOURCE FILE');
    END;
END;

VAR
  S1,S2:STRING;
BEGIN
  INPUTnAMEfILE(S1,S2);
  TRANSFORMATION(S1,S2);
END.