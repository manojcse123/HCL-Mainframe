
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BATCHTOTAL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 N             PIC 9(3).
       01 I             PIC 9(3) VALUE ZERO.
       01 TRANS-AMOUNT  PIC 9(5).
       01 TOTAL-AMOUNT  PIC 9(5) VALUE ZERO.
       01 TEMP-TOTAL    PIC 9(6).

       PROCEDURE DIVISION.

           DISPLAY "ENTER NUMBER OF TRANSACTIONS:"
           ACCEPT N

           PERFORM VARYING I FROM 1 BY 1
               UNTIL I > N

               DISPLAY "ENTER TRANSACTION AMOUNT:"
               ACCEPT TRANS-AMOUNT

               COMPUTE TEMP-TOTAL =
                   TOTAL-AMOUNT + TRANS-AMOUNT

               IF TEMP-TOTAL > 99999
                   DISPLAY "TOTAL OVERFLOW"
                   STOP RUN
               ELSE
                   MOVE TEMP-TOTAL TO TOTAL-AMOUNT
               END-IF

           END-PERFORM

           DISPLAY "TOTAL AMOUNT: " TOTAL-AMOUNT

           STOP RUN.
