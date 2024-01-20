      ******************************************************************
      * Author: Mykola Lotoshnykov, mykola.lotoshnykov@gmail.com
      * Date: 20240115
      * Purpose: Just for fan. Code reads file and prints some data
      * to console. Source of BTC data is coinmarketcap.com.
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BTC-DATA-READ.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT BTCDATA ASSIGN TO 'data\BTC_20112022_19012023.csv'
           ORGANISATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD BTCDATA RECORDING MODE V.
       01 CSV-FILE-ROW PIC X(200).

       WORKING-STORAGE SECTION.
       01  BTC-DATA-OUT.
           05 TIME-OPEN PIC X(29).
           05 TIME-CLOSE PIC X(29).
           05 TIME-HIGH PIC X(27).
           05 TIME-LOW PIC X(29).
           05 NAME-VALUE PIC X(4).
      *>      23263.4151260445
           05 OPEN-PRICE COMP-2.
           05 HIGH-PRICE COMP-2.
           05 LOW-PRICE COMP-2.
           05 CLOSE-PRICE COMP-2.
      *>      25371367757.61;442391167095.22
           05 VOLUME COMP-2.
           05 MARKETCAP COMP-2.
           05 TS PIC X(27).

       01  WS-EOF PIC X(1).
       01  WS-SPACE PIC X VALUE SPACE.

       01  SUBSTRING-POS.
           05 DATE-START-POS PIC 9(1) VALUE 2.
           05 DATE-END-POS PIC 9(2) VALUE 10.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            OPEN INPUT BTCDATA.
            PERFORM UNTIL WS-EOF = 'Y'
               READ BTCDATA INTO CSV-FILE-ROW
                       AT END MOVE 'Y' TO WS-EOF
                   NOT AT END UNSTRING CSV-FILE-ROW DELIMITED BY ";"
                   INTO TIME-OPEN, TIME-CLOSE, TIME-HIGH, TIME-LOW
                       NAME-VALUE,
                       OPEN-PRICE, HIGH-PRICE, LOW-PRICE, CLOSE-PRICE
                       VOLUME, MARKETCAP, TS
                   DISPLAY
                       TIME-HIGH(DATE-START-POS:DATE-END-POS), WS-SPACE,
                       HIGH-PRICE, WS-SPACE, VOLUME
      *>              DISPLAY BTC-FILE
               END-READ
            END-PERFORM.
            CLOSE BTCDATA.

            STOP RUN.
       END PROGRAM BTC-DATA-READ.
