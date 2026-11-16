
       IDENTIFICATION DIVISION.
       PROGRAM-ID. WITHDRAW.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WITHDRAW-AMOUNT PIC S9(7) VALUE ZERO.

       PROCEDURE DIVISION.

           DISPLAY "ENTER WITHDRAWAL AMOUNT:"
           ACCEPT WITHDRAW-AMOUNT

           IF WITHDRAW-AMOUNT < 100
               DISPLAY "REJECTED"
           ELSE
               IF WITHDRAW-AMOUNT > 50000
                   DISPLAY "REJECTED"
               ELSE
                   DISPLAY "ACCEPTED"
               END-IF
           END-IF

           STOP RUN.
