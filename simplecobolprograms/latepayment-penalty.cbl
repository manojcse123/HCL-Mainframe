       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOAN-PENALTY.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  WS-INSTALMENT       PIC 9(7)V99.
       01  WS-DAYS-LATE        PIC 999.

       01  WS-PENALTY          PIC 9(7)V99.
       01  WS-MAX-PENALTY      PIC 9(7)V99.
       01  WS-TOTAL-PAYABLE    PIC 9(7)V99.

       01  WS-PENALTY-OUT      PIC Z(6)9.99.
       01  WS-TOTAL-OUT        PIC Z(6)9.99.

       PROCEDURE DIVISION.
           DISPLAY "ENTER INSTALMENT AMOUNT:"
           ACCEPT WS-INSTALMENT

           DISPLAY "ENTER DAYS LATE:"
           ACCEPT WS-DAYS-LATE

           IF WS-INSTALMENT > 1000000
              OR WS-DAYS-LATE > 365
               DISPLAY "INVALID INPUT"
           ELSE
               IF WS-DAYS-LATE = 0
                   MOVE 0 TO WS-PENALTY
               ELSE
                   COMPUTE WS-PENALTY ROUNDED =
                       WS-INSTALMENT * WS-DAYS-LATE / 100

                   COMPUTE WS-MAX-PENALTY ROUNDED =
                       WS-INSTALMENT * 10 / 100

                   IF WS-PENALTY > WS-MAX-PENALTY
                       MOVE WS-MAX-PENALTY TO WS-PENALTY
                   END-IF
               END-IF

               COMPUTE WS-TOTAL-PAYABLE =
                   WS-INSTALMENT + WS-PENALTY

               MOVE WS-PENALTY TO WS-PENALTY-OUT
               MOVE WS-TOTAL-PAYABLE TO WS-TOTAL-OUT

               DISPLAY "Penalty: " WS-PENALTY-OUT
               DISPLAY "Total payable: " WS-TOTAL-OUT
           END-IF

           STOP RUN.
