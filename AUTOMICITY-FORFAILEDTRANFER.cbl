
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ATOMICITY.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 SOURCE-BALANCE PIC 9(7) VALUE ZERO.
       01 DEST-BALANCE   PIC 9(7) VALUE ZERO.
       01 TRANS-AMOUNT   PIC 9(7) VALUE ZERO.

       01 OLD-SOURCE     PIC 9(7).
       01 OLD-DEST       PIC 9(7).

       01 FAILURE-FLAG   PIC X.
       01 FAILURE-STAGE  PIC 9.

       PROCEDURE DIVISION.

           DISPLAY "ENTER SOURCE BALANCE:"
           ACCEPT SOURCE-BALANCE

           DISPLAY "ENTER DESTINATION BALANCE:"
           ACCEPT DEST-BALANCE

           DISPLAY "ENTER TRANSFER AMOUNT:"
           ACCEPT TRANS-AMOUNT

           DISPLAY "FAILURE FLAG (Y/N):"
           ACCEPT FAILURE-FLAG

           DISPLAY "FAILURE STAGE (0-3):"
           ACCEPT FAILURE-STAGE

           MOVE SOURCE-BALANCE TO OLD-SOURCE
           MOVE DEST-BALANCE TO OLD-DEST

           IF TRANS-AMOUNT <= 0
               DISPLAY "ROLLED BACK"

           ELSE
               IF TRANS-AMOUNT > SOURCE-BALANCE
                   DISPLAY "ROLLED BACK"

               ELSE
                   IF FAILURE-FLAG = 'Y'
                      AND FAILURE-STAGE = 1

                       DISPLAY "ROLLED BACK"

                   ELSE
                       SUBTRACT TRANS-AMOUNT
                           FROM SOURCE-BALANCE

                       IF FAILURE-FLAG = 'Y'
                          AND FAILURE-STAGE = 2

                           MOVE OLD-SOURCE TO SOURCE-BALANCE
                           MOVE OLD-DEST TO DEST-BALANCE

                           DISPLAY "ROLLED BACK"

                       ELSE
                           ADD TRANS-AMOUNT
                               TO DEST-BALANCE

                           IF FAILURE-FLAG = 'Y'
                              AND FAILURE-STAGE = 3

                               MOVE OLD-SOURCE
                                   TO SOURCE-BALANCE

                               MOVE OLD-DEST
                                   TO DEST-BALANCE

                               DISPLAY "ROLLED BACK"

                           ELSE
                               DISPLAY "COMMITTED"

                           END-IF
                       END-IF
                   END-IF
               END-IF
           END-IF

           DISPLAY "FINAL SOURCE BALANCE: "
               SOURCE-BALANCE

           DISPLAY "FINAL DESTINATION BALANCE: "
               DEST-BALANCE

           STOP RUN.
