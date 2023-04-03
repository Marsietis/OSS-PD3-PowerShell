# OSS-PD3-PowerShell

## LT:
OS praktikos darbas #3

Naudojant „Windows PowerShell“ integruotą „scriptinimo“ aplinką (ISE), sukurti programą („script“), kuri analizuotų kompiuteryje veikiančius servisus, įvykius bei kitus operacinės sistemos parametrus. Programėlė turi tenkinti šiuos reikalavimus:
Bendroji dalis:
1)	Kintamųjų ir funkcijų pavadinimai turi būti rašomi anglų kalba;
2)	Elementai turi turėti prasmingus pavadinimus (pvz. $processName vs $aaa);
3)	Kintamieji pradedami rašyti mažąja raide;
4)	Funkcijos rašomos pradedant didžiąja raide (pvz. Get-WordsCount );
Specialioji dalis:
1)	Programa turi atlikti šiuos veiksmus: 
•	Naudojant WMI objektą nuskaityti šią sistemos informaciją:
1)	Kompiuterio pavadinimą;
2)	Kompiuterio diskų parametrus;
3)	Centrinio procesoriaus naudojimą einamuoju metu;
4)	Kompiuteryje esančios visos ir laisvos atminties kiekį MB (Total Physical Memory/ Free Physical Memory);
5)	Nuskaitytus duomenis įrašyti į failą nurodant, datą kada duomenys buvo nuskaityti;
•	Nuskaityti ir į atskirus failus įrašyti sistemoje esančius servisus. Viename faile turi būti aktyvūs (running), kitame neaktyvūs (stopped) servisai. Sukurti funkciją, kuriai per parametrą būtų perduodamas serviso pavadinimas, o išvedama serviso būsena.
•	Nuskaityti 10 paskutinių sisteminių įvykių iš EventLog objekto. Sukurti funkciją, kuriai per parametrą būtų perduodamas programos pavadinimas ir norimų grąžinti įvykių skaičius. Funkcija turi sukurti failą <ProgramosPavadinimas_Data>, kuriame būtų įrašyti atrinkti įvykiai.
•	Naudojant PowerShell iškviesti pasirinktą „SysInternal“ programą ir jos rezultatą įrašyti į failą.
•	Sukurti Windows užduotį (Windows Scheduled Task), kuri įvykdytų sukurtą script‘ą pasirinktu laiku.

## EN:

OS practice paper #3

Using the Windows PowerShell Integrated Scripting Environment (ISE), create a program ("script") that analyses the services, events and other operating system parameters running on the PC. The application must meet the following requirements:
General:
1) Variable and function names must be in English;
2) Elements must have meaningful names (e.g. $processName vs $aaa);
3) Variables should start with a lower case letter;
4) Functions shall be capitalized (e.g. Get-WordsCount );
Special part:
1) The program must do the following: 
- Use a WMI object to retrieve the following system information:
1) Computer name;
2) The computer's disk parameters;
3) Current CPU usage;
4) The amount of Total Physical Memory/ Free Physical Memory (MB) available on the computer;
5) Save the scanned data in a file with the date on which the data was scanned;
- Scan and write to separate files the services in the system. One file must contain active (running) and one file must contain inactive (stopped) services. Create a function that passes the name of the service via a parameter and outputs the status of the service.
- Read the last 10 system events from the EventLog object. Create a function to pass the name of the application and the number of events to be returned via a parameter. The function shall create a file <ProgrammeName_Data> containing the selected events.
- Use PowerShell to call the selected SysInternal program and write its result to the file.
- Create a Windows Scheduled Task to execute the generated script at the selected time.
