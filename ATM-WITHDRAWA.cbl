       IDENTIFICATION DIVISION.
       PROGRAM-ID. ATM-WITHDRAWAL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
          01 AMOUNT PIC 9(5) VALUE 0.
          01 WITHDRAW PIC 9(5) VALUE 0.
       01 BALANCE PIC 9(5) VALUE 10000.
          01 CHOICE PIC 9 VALUE 0.

       PROCEDURE DIVISION.
           PERFORM UNTIL CHOICE = 4
               DISPLAY " "
               DISPLAY "ATM MACHINE DASHBOARD"
               DISPLAY "1. Check Balance"
               DISPLAY "2. Withdraw Amount"
               DISPLAY "3. Deposit Amount"
               DISPLAY "4. Exit"
               DISPLAY "Enter your choice: "
               ACCEPT CHOICE

               EVALUATE CHOICE
                   WHEN 1
                       DISPLAY "CURRENT BALANCE: "
                       DISPLAY BALANCE

                   WHEN 2
                       DISPLAY "Enter amount to withdraw: "
                       ACCEPT WITHDRAW

                       IF WITHDRAW <= 0 OR FUNCTION MOD(WITHDRAW, 100)
                          NOT EQUAL TO 0
                           DISPLAY "Invalid withdrawal amount"
                       ELSE
                           IF BALANCE < WITHDRAW
                               DISPLAY "Insufficient balance"
                           ELSE
                               COMPUTE BALANCE = BALANCE - WITHDRAW
                               DISPLAY "Withdrawal successful"
                               DISPLAY "Remaining balance: "
                               DISPLAY BALANCE
                           END-IF
                       END-IF

                   WHEN 3
                       DISPLAY "Enter amount to deposit: "
                       ACCEPT AMOUNT

                       IF AMOUNT > 0
                           COMPUTE BALANCE = BALANCE + AMOUNT
                           DISPLAY "Deposit successful"
                           DISPLAY "Updated balance: "
                           DISPLAY BALANCE
                       ELSE
                           DISPLAY "Invalid deposit amount"
                       END-IF

                   WHEN 4
                       DISPLAY "Thank you for using the ATM"

                   WHEN OTHER
                       DISPLAY "Invalid choice"
               END-EVALUATE
           END-PERFORM

           STOP RUN.
