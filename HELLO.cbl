      ******************************************************************
      * Author: mykola.lotoshnykov@gmail.com
      * Date: 20240113
      * Purpose: Just for Fan
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBOL-FAN-HELLO-WORLD.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  HELLO-WORLD.
           05  HW_STR PIC X(6) VALUE 'HELLO,'.
           05  HW_IN PIC X(20).
           05  HW_OUT PIC X(30).
       01  CMDLINE PIC X(20).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY 'Please provide the name and press Enter:'.
            ACCEPT CMDLINE FROM SYSIN.
            MOVE FUNCTION UPPER-CASE(CMDLINE) TO HW_IN.

            STRING
               HW_STR DELIMITED BY SIZE,
               SPACE,
               FUNCTION TRIM(HW_IN) DELIMITED BY SIZE,
               '!'
               INTO HW_OUT
                   ON OVERFLOW DISPLAY 'String is too long.'
               NOT ON OVERFLOW DISPLAY HW_OUT
               END-STRING.
            STOP RUN.
       END PROGRAM COBOL-FAN-HELLO-WORLD.
