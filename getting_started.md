# This is a guide to install clean programming language on your machine and write your first program

## Feel to contact us if it did not work out

## Windows
- Download the aprropiate package for your machine ([32bit](https://ftp.cs.ru.nl/Clean/Clean30/windows/Clean_3.0_32.zip) or [64bit](https://ftp.cs.ru.nl/Clean/Clean30/windows/Clean_3.0_64.zip))
- Unzip the package whereever you want
- Click on CleanIDE.exe
- Create a new project from the file menu (on the top right of the screen).
- Create a new file from the file menu (on the top right of the screen). (note : names of project and file should be the same)
- Write the following in the file to test your enviroment
  - module (your filename)
  - import StdEnv
   - Start = "Hello World"
## Linux and Mac
- Download the aprropiate package for your machine
  - [Linux(32bit)](https://ftp.cs.ru.nl/Clean/Clean30/linux/clean3.0_32.tar.gz)
  - [Linux(64bit)](https://ftp.cs.ru.nl/Clean/Clean30/linux/clean3.0_64.tar.gz)
  - [Mac](https://ftp.cs.ru.nl/Clean/Clean30/macosx/clean3.0.zip)
- Unzip it inside the "Documents" folder.
- Open the terminal and execute following commands
  - echo 'alias clm="~/Documents/clean/bin/clm" ' >> .bashrc
  - cd Documents
  - cd clean
  - make
  - cd
  - source ./.bashrc
 - Open your text editor and write
    - module (your filename)
    - import StdEnv
    - Start = "Hello World"
 - You can compile and run your file by writing this command to the terminal
    - clm (Your file's name) && ./a.out
