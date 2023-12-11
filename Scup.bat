echo off
cd assets
goto start
:start
title Scup! A Seek-the-Cup Game
goto load

:save
echo %animspeed%
pause
del values.bat
echo set /a coins=%coins%>> values.bat
echo set /a animspeed=%animspeed%>> values.bat
echo set user=%user%>> values.bat
echo set host=%host%>> values.bat
echo set /a cogversion=%cogversion%>> values.bat
echo set /a versiond1=1>> values.bat
echo set /a versiond2=0>> values.bat
echo set /a versiond3=1>> values.bat
echo Saved!
timeout /t 3 > nul
goto %flashback%

:load
call values.bat
if "%user%" equ "user" (
     goto choosename
) else (
     goto menu
)
:choosename
cls
echo Welcome to Scup 1.0.1
echo Made by dk865
echo Windows Gear version: Cogwheel Version 1
echo.
echo Pick a username. You can change this anytime later.
echo.
set /p user= ~$ 
echo.
echo Hello %user%@%host%! Glad to have you here!
timeout /t 2 > nul
cls
goto menu

:easter
echo Jack D, there's a seven on the label
echo One glass on the living room table
echo Phone face down, church up loud
echo Was tryna drown you out tonight but
echo First sip, I could feel you on my shoulder
echo The Tennessee heat had me feelin' colder
echo Thought a drink would get you off my mind
echo But this bottle tastes like 865 (409-1021), yeah
echo One last time, don't think twice
echo Girl, just pick it up and come over
echo Give the bedroom door a little closure
echo I know I told you I wouldn't call, and I tried
echo But this bottle tastes like 865 (409-1021)
echo This bottle tastes like 865 (409-1021)
echo You might think I don't really want you with me
echo You might tell me to empty out my whiskey
echo Or try changin' what I'm holdin' in my hand
echo Try another liquor, try another brand but
echo It don't matter if I got my lips
echo On a different drink, on a different night
echo Yeah, the second that I take a sip, all I'm gonna think is
echo This bottle tastes like 865 (409-1021), yeah
echo One last time, don't think twice
echo Girl, just pick it up and come over
echo Give the bedroom door a little closure
echo I know I told you I wouldn't call, and I tried
echo But this bottle tastes like 865 (409-1021)
echo This bottle tastes like 865 (409-1021)
echo Thought a drink would get you off my mind
echo I ain't sayin' I love you, but I might
echo 'Cause this bottle tastes like 865 (409-1021), yeah
echo One last time, don't think twice
echo Girl, just pick it up and come over
echo Give the bedroom door a little closure
echo I know I told you I wouldn't call, and I tried
echo But this bottle tastes like 865 (409-1021)
echo This bottle tastes like 865 (409-1021)
echo This bottle tastes like 865 (409-1021)
echo This bottle tastes like 865 (409-1021)

:menu
set flashback=menu
cls
echo Welcome to Scup v1.0.1!
echo Windows Gear version: Cogwheel v1
echo Made by dk865
echo.
echo Scup is a game where you need to find the Gold hidden under one of 3 cups, that the Dealer will mix up. This game is rather simple and very easy, but it is random!
echo.
echo Coins: %coins%
echo.
echo Choose an option:
echo -----------------
echo 1. Start the Game
echo 2. Help
echo 3. Change Username
echo 4. What's New
echo 5. Save Game
echo 6. Reset Game
echo 7. Change Host (the @%host%) Cost is 25 Coins
echo 8. Exit
echo.
set /p gotowhat=%user%@%host%~$

if "%gotowhat%" equ "1" (
      cls
      goto game
) else if "%gotowhat%" equ "2" (
      cls
      goto help
) else if "%gotowhat%" equ "3" (
      cls
      goto choosename
) else if "%gotowhat%" equ "4" (
      cls
      goto whatsnew
) else if "%gotowhat%" equ "5" (
      cls
      goto save
) else if "%gotowhat%" equ "6" (
      call reset.bat
      goto start
) else if "%gotowhat%" equ "7" (
     echo.
     echo Are you sure? This will take 25 coins out of your bank, and you can't get them back! This will also reset when you reset the game, fyi.
     echo.
     set /p changehostq=%user%@%host%~$
     if "%changehostq%" equ "y" (
          echo.
          if %coins% leq 25 (
               echo You can't do this, you don't have enough coins, and if you have 25, theres no point, because then you won't have enough money to play anymore.
               pause
               goto menu
          ) else (
               echo Okay then! What do you want it to be?
               echo.
               set /p host=%user%@%host%~$
               echo.
               echo Hello, %user%@%host%!
               timeout /t 2 > nul
               goto menu
          )
     ) else if "%changehostq%" equ "n" (
          echo.
          echo Okay.
          timeout /t 2 > nul
          goto menu
     ) else (
          echo Come On!!! I am tired of this!!!
          timeout /t 3 > nul
          goto menu
     )
) else if "%gotowhat%" equ "8" (
      cls
      goto save
      goto quit
) else if "%gotowhat%" equ "8654091021" (
      goto easter
) else (
      echo.
      echo Why do you have to do this to me?
      timeout /t 3 > nul
      goto menu
)

:quit
set flashback=terminate
echo It was fun having you play! Thanks for playing! First we will save the game.
pause
goto save

:terminate
exit

:help
cls
echo What do you need help with?
echo ---------------------------
echo 1. How to play
echo 2. Report a bug
echo 3. Go Back
echo.
set /p help= %user%@%host%~$ 
if "%help%" equ "1" (
      goto rules
) else if "%help%" equ "2" (
       goto bugreport
) else if "%help%" equ "3" (
      goto :menu
) else (
      Seriously???
      timeout /t 3 > nul
      goto :help
)

:rules
echo This is a simple game. You will start out with 10 coins. You start out by making a bet, and guessing what cup the gold is under. There will be 3 cups on the table, and under one of them will be some gold. If you choose the right cup, you will get your bet times 2 in gold. If you choose the wrong one, the ammount you bet is removed from your coins.
pause
goto menu

:bugreport
echo There is a google that you can access if you select y.
echo.
echo Also, this might be an older version of the game. Press y, then look at the top. It will show the latest version of the game.
echo.
echo Pick an Option
echo --------------
echo Y. Fill out form Now
echo n. Don't fill out now.
echo.
set /p bugyn= %user%@%host%~$ 

if "%bugyn%" equ "y" (
      echo Okay! Here you go!
      timeout /t 2 > nul
      start bugreport.html
      pause
      goto menu
) else if "%bugyn%" equ "n" (
      echo.
      echo No problem!
      pause
      goto menu
) else (
      echo Please just choose a valid option!!!
      timeout /t 3
      cls
      goto bugreport
)

:whatsnew
cls
echo Scup Version 1.0.1
echo.
echo Just fixed some very minor bugs, such as an invalid timeout command, and the scup version not displaying the 3 didgets correctly.
echo.
echo.
echo Scup Version 1.0.0
echo.
echo Just released this game! Took me a week to devolep, but hope for future updates! (: I chose the terminal input name to be cogwheel, because they don't depend on, or use any other gears. This code doesn't depend on any packages, or anything else. You just need the default system terminal, and everything is ready to go! (hopefully lol)
echo.
echo. Visit https://sites.google.com/view/rust865/cogwheel/cogwin/scup for more info and future updates for this game!
echo -Dylan (dk865)
echo ---------------
echo.
echo My plans as of this current release:
echo.
echo 1. Design some more simple, maybe even some advanced batch file tools and games.
echo 2. Learn the Linux Shell Script Language, then convert all of the batch files that I've made so far, so that there is also a linux version available!
echo 3. Design a well done batch file, that is basically a substitute for the terminal, to type a linux command, and it be converted into a powershell command! Now, this will take a while, and I'm keeping the name secret for now. To read more about it, go to https://sites.google.com/view/rust865/plans/sudo-on-windows
pause
goto menu

:game
if "%coins%" LEQ "-1" (
     echo You don't have enough coins to keep playing! Reseting the Game!!!
     pause
     call reset.bat
     goto start
) else (
cls
echo.
echo.
echo.
echo.
echo.
echo          ________              ________              ________
echo         /        \            /        \            /        \
echo        /          \          /          \          /          \
echo       /            \        /            \        /            \
echo      /              \      /              \      /              \
echo    -----------------------------------------------------------------
echo.
echo What cup do you think the gold's under? (Going left to right.)
echo.
set /p choice= %user%@%host%~$ 
echo.
echo How much are you betting out of your coins that it is correct?
echo.
set /p bet= %user%@%host%~$ 
if %bet% gtr %coins% (
    echo Heyyyy!!! What are you trying to do! You don't have enough coins to bet that!!!!! Try again.
    pause
    goto game
) else (
    goto getready
)

:getready
echo.
echo Okay! On we go!
timeout /t 1 > nul
set /a correct=%RANDOM%%%3+1
goto game%correct%
)
:game1
cls
echo.
echo.
echo.
echo.
echo.
echo          ________              ________              ________
echo         /        \            /        \            /        \
echo        /          \          /          \          /          \
echo       /            \        /            \        /            \
echo      /              \      /              \      /              \
echo    -----------------------------------------------------------------
echo.
timeout /t %animspeed% > nul
cls
echo.
echo.
echo.
echo.
echo          ________
echo         /        \             ________              ________
echo        /          \           /        \            /        \
echo       /            \         /          \          /          \
echo      /______________\       /            \        /            \
echo           OOOOOO           /              \      /              \
echo    -----------------------------------------------------------------
echo.
timeout /t %animspeed% > nul
cls
echo.
echo.
echo.
echo          ________
echo         /        \
echo        /          \            ________              ________
echo       /            \          /        \            /        \
echo      /______________\        /          \          /          \
echo            OOOO             /            \        /            \
echo           OOOOOO           /              \      /              \
echo    -----------------------------------------------------------------
echo.
timeout /t %animspeed% > nul
cls
echo.
echo.
echo          ________
echo         /        \
echo        /          \
echo       /            \           ________              ________
echo      /______________\         /        \            /        \
echo             oo               /          \          /          \
echo            OOOO             /            \        /            \
echo           OOOOOO           /              \      /              \
echo    -----------------------------------------------------------------
echo.
timeout /t %animspeed% > nul
cls
echo.
echo          ________
echo         /        \
echo        /          \
echo       /            \
echo      /______________\          ________              ________
echo                               /        \            /        \
echo             oo               /          \          /          \
echo            OOOO             /            \        /            \
echo           OOOOOO           /              \      /              \
echo    -----------------------------------------------------------------
echo.
if "%choice%" equ "1" (
    set /a bet*=2
    set /a coins+=bet
    timeout /t 1 > nul
    echo Nice Guess! You got it correct! +%bet% Coins.
    pause
) else (
    echo Sorry, but you didn't get it... -%bet% coins.
    set /a coins-=bet
    pause
)
timeout /t %animspeed% > nul
cls
echo.
echo.
echo          ________
echo         /        \
echo        /          \
echo       /            \           ________              ________
echo      /______________\         /        \            /        \
echo             oo               /          \          /          \
echo            OOOO             /            \        /            \
echo           OOOOOO           /              \      /              \
echo    -----------------------------------------------------------------
echo.
timeout /t %animspeed% > nul
cls
echo.
echo.
echo.
echo          ________
echo         /        \
echo        /          \            ________              ________
echo       /            \          /        \            /        \
echo      /______________\        /          \          /          \
echo            OOOO             /            \        /            \
echo           OOOOOO           /              \      /              \
echo    -----------------------------------------------------------------
echo.
timeout /t %animspeed% > nul
cls
echo.
echo.
echo.
echo.
echo          ________
echo         /        \             ________              ________
echo        /          \           /        \            /        \
echo       /            \         /          \          /          \
echo      /______________\       /            \        /            \
echo           OOOOOO           /              \      /              \
echo    -----------------------------------------------------------------
echo.
goto again

:again
timeout /t %animspeed% > nul
cls
echo.
echo.
echo.
echo.
echo.
echo          ________              ________              ________
echo         /        \            /        \            /        \
echo        /          \          /          \          /          \
echo       /            \        /            \        /            \
echo      /              \      /              \      /              \
echo    -----------------------------------------------------------------
echo.
echo Do you want to play again? Coins: %coins% [Y/n]
echo.
set /p again= %user%@%host%~$ 
if "%again%" equ "y" (
     cls
     goto game
) else if "%again%" equ "n" (
     cls
     goto menu
) else (
     echo.
     echo Why? Just Why?
     timeout /t 3 > nul
     cls
     goto menu
)

:game2
cls
echo.
echo.
echo.
echo.
echo.
echo          ________              ________              ________
echo         /        \            /        \            /        \
echo        /          \          /          \          /          \
echo       /            \        /            \        /            \
echo      /              \      /              \      /              \
echo    -----------------------------------------------------------------
echo.
timeout /t %animspeed% > nul
cls
echo.
echo.
echo.
echo.
echo                                ________
echo          ________             /        \             ________
echo         /        \           /          \           /        \
echo        /          \         /            \         /          \
echo       /            \       /______________\       /            \
echo      /              \           OOOOOO           /              \
echo    -----------------------------------------------------------------
echo.
timeout /t %animspeed% > nul
cls
echo.
echo.
echo.
echo                                ________
echo                               /        \
echo          ________            /          \            ________
echo         /        \          /            \          /        \
echo        /          \        /______________\        /          \
echo       /            \             OOOO             /            \
echo      /              \           OOOOOO           /              \
echo    -----------------------------------------------------------------
echo.
timeout /t %animspeed% > nul
cls
echo.
echo.
echo                                ________
echo                               /        \
echo                              /          \
echo          ________           /            \           ________
echo         /        \         /______________\         /        \
echo        /          \               oo               /          \
echo       /            \             OOOO             /            \
echo      /              \           OOOOOO           /              \
echo    -----------------------------------------------------------------
echo.
timeout /t %animspeed% > nul
cls
echo.
echo                                ________
echo                               /        \
echo                              /          \
echo                             /            \
echo          ________          /______________\          ________
echo         /        \                                  /        \
echo        /          \               oo               /          \
echo       /            \             OOOO             /            \
echo      /              \           OOOOOO           /              \
echo    -----------------------------------------------------------------
echo.
if "%choice%" equ "2" (
    set /a bet*=2
    set /a coins+=bet
    timeout /t 1 > nul
    echo Nice Guess! You got it correct! +%bet% Coins.
    pause
) else (
    echo Sorry, but you didn't get it... -%bet% coins.
    set /a coins-=bet
    pause
)
timeout /t %animspeed% > nul
cls
echo.
echo.
echo                                ________
echo                               /        \
echo                              /          \
echo          ________           /            \           ________
echo         /        \         /______________\         /        \
echo        /          \               oo               /          \
echo       /            \             OOOO             /            \
echo      /              \           OOOOOO           /              \
echo    -----------------------------------------------------------------
echo.
timeout /t %animspeed% > nul
cls
echo.
echo.
echo.
echo                                ________
echo                               /        \
echo          ________            /          \            ________
echo         /        \          /            \          /        \
echo        /          \        /______________\        /          \
echo       /            \             OOOO             /            \
echo      /              \           OOOOOO           /              \
echo    -----------------------------------------------------------------
echo.
timeout /t %animspeed% > nul
cls
echo.
echo.
echo.
echo.
echo                                ________
echo          ________             /        \             ________
echo         /        \           /          \           /        \
echo        /          \         /            \         /          \
echo       /            \       /______________\       /            \
echo      /              \           OOOOOO           /              \
echo    -----------------------------------------------------------------
echo.
goto again

:game3
cls
echo.
echo.
echo.
echo.
echo.
echo          ________              ________              ________
echo         /        \            /        \            /        \
echo        /          \          /          \          /          \
echo       /            \        /            \        /            \
echo      /              \      /              \      /              \
echo    -----------------------------------------------------------------
echo.
timeout /t %animspeed% > nul
cls
echo.
echo.
echo.
echo.
echo                                                      ________
echo          ________              ________             /        \
echo         /        \            /        \           /          \
echo        /          \          /          \         /            \
echo       /            \        /            \       /______________\
echo      /              \      /              \           OOOOOO         
echo    -----------------------------------------------------------------
echo.
timeout /t %animspeed% > nul
cls
echo.
echo.
echo.
echo                                                      ________
echo                                                     /        \
echo          ________              ________            /          \
echo         /        \            /        \          /            \
echo        /          \          /          \        /______________\
echo       /            \        /            \             OOOO
echo      /              \      /              \           OOOOOO         
echo    -----------------------------------------------------------------
echo.
timeout /t %animspeed% > nul
cls
echo.
echo.
echo                                                      ________
echo                                                     /        \
echo                                                    /          \
echo          ________              ________           /            \
echo         /        \            /        \         /______________\
echo        /          \          /          \               oo
echo       /            \        /            \             OOOO
echo      /              \      /              \           OOOOOO         
echo    -----------------------------------------------------------------
echo.
timeout /t %animspeed% > nul
cls
echo.
echo                                                      ________
echo                                                     /        \
echo                                                    /          \
echo                                                   /            \
echo          ________              ________          /______________\
echo         /        \            /        \         
echo        /          \          /          \               oo
echo       /            \        /            \             OOOO
echo      /              \      /              \           OOOOOO         
echo    -----------------------------------------------------------------
echo.
if "%choice%" equ "3" (
    set /a bet*=2
    set /a coins+=bet
    timeout /t 1 > nul
    echo Nice Guess! You got it correct! +%bet% Coins.
    pause
) else (
    echo Sorry, but you didn't get it... -%bet% coins.
    set /a coins-=bet
    pause
)
timeout /t %animspeed% > nul
cls
echo.
echo.
echo                                                      ________
echo                                                     /        \
echo                                                    /          \
echo          ________              ________           /            \
echo         /        \            /        \         /______________\
echo        /          \          /          \               oo
echo       /            \        /            \             OOOO
echo      /              \      /              \           OOOOOO         
echo    -----------------------------------------------------------------
echo.
timeout /t %animspeed% > nul
cls
echo.
echo.
echo.
echo                                                      ________
echo                                                     /        \
echo          ________              ________            /          \
echo         /        \            /        \          /            \
echo        /          \          /          \        /______________\
echo       /            \        /            \             OOOO
echo      /              \      /              \           OOOOOO         
echo    -----------------------------------------------------------------
echo.
timeout /t %animspeed% > nul
cls
echo.
echo.
echo.
echo.
echo                                                      ________
echo          ________              ________             /        \
echo         /        \            /        \           /          \
echo        /          \          /          \         /            \
echo       /            \        /            \       /______________\
echo      /              \      /              \           OOOOOO         
echo    -----------------------------------------------------------------
echo.
goto again