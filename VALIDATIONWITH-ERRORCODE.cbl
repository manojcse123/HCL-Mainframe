
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TRANSINFO.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 TRANS-TYPE PIC X.
       01 AMOUNT-TEXT PIC X(10).
       01 AMOUNT-VALUE PIC 9(8)V99.

       PROCEDURE DIVISION.

           DISPLAY "ENTER TRANSACTION TYPE (C/D):"
           ACCEPT TRANS-TYPE

           DISPLAY "ENTER AMOUNT:"
           ACCEPT AMOUNT-TEXT

           IF TRANS-TYPE NOT = 'C'
              AND TRANS-TYPE NOT = 'D'
               DISPLAY "ERR_TYPE"
           ELSE
               IF FUNCTION TEST-NUMVAL(AMOUNT-TEXT) NOT = 0
                   DISPLAY "ERR_AMOUNT_FORMAT"
               ELSE
                   COMPUTE AMOUNT-VALUE =
                       FUNCTION NUMVAL(AMOUNT-TEXT)

                   IF AMOUNT-VALUE <= 0
                       DISPLAY "ERR_AMOUNT_RANGE"
                   ELSE
                       DISPLAY "ACCEPTED"
                   END-IF
               END-IF
           END-IF

           STOP RUN.
