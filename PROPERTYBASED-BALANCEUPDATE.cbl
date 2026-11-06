
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TRANSFER.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 SOURCE-BALANCE PIC 9(7)V99.
       01 DEST-BALANCE  PIC 9(7)V99.
       01 TRANS-AMOUNT  PIC 9(7)V99.
       01 NEW-SOURCE    PIC 9(7)V99.
       01 NEW-DEST      PIC 9(7)V99.
       01 OLD-TOTAL     PIC 9(8)V99.
       01 NEW-TOTAL     PIC 9(8)V99.

       PROCEDURE DIVISION.

           DISPLAY "ENTER SOURCE BALANCE:"
           ACCEPT SOURCE-BALANCE

           DISPLAY "ENTER DESTINATION BALANCE:"
           ACCEPT DEST-BALANCE

           DISPLAY "ENTER TRANSFER AMOUNT:"
           ACCEPT TRANS-AMOUNT

           IF TRANS-AMOUNT <= 0
               DISPLAY "REJECTED: INVALID AMOUNT"

           ELSE
               IF TRANS-AMOUNT > SOURCE-BALANCE
                   DISPLAY "REJECTED: INSUFFICIENT BALANCE"

               ELSE
                   COMPUTE OLD-TOTAL =
                       SOURCE-BALANCE + DEST-BALANCE

                   COMPUTE NEW-SOURCE =
                       SOURCE-BALANCE - TRANS-AMOUNT

                   COMPUTE NEW-DEST =
                       DEST-BALANCE + TRANS-AMOUNT

                   COMPUTE NEW-TOTAL =
                       NEW-SOURCE + NEW-DEST

                   IF OLD-TOTAL = NEW-TOTAL
                       AND NEW-SOURCE >= 0
                       AND NEW-DEST >= 0

                       DISPLAY "TRANSFER SUCCESSFUL"
                       DISPLAY "SOURCE BALANCE: "
                           NEW-SOURCE
                       DISPLAY "DESTINATION BALANCE: "
                           NEW-DEST

                   ELSE
                       DISPLAY "TRANSFER FAILED"
                   END-IF
               END-IF
           END-IF

           STOP RUN.
