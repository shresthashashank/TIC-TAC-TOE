format PE console
include 'win32ax.inc'

;=======================================
section '.code' code readable executable
;=======================================


Intro:

  cinvoke printf,"___         __        __             ___    __     ___       __     ___  __   ___     __              ___ %c",10
  cinvoke printf," |  |__| | /__`    | /__`     /\      |  | /  ` __  |   /\  /  ` __  |  /  \ |__     / _`  /\   |\/| |__  %c",10
  cinvoke printf," |  |  | | .__/    | .__/    /~~\     |  | \__,     |  /~~\ \__,     |  \__/ |___    \__> /~~\  |  | |___ %c",10
  cinvoke printf,"                                                                                                           %c",10
  cinvoke printf," __   __   ___      ___  ___  __           __          __           __   __   ___        __                              __             __   ___%c",10
  cinvoke printf,"/  ` |__) |__   /\   |  |__  |  \    |  | /__` | |\ | / _`     /\  /__` /__` |__   |\/| |__) |    \ /    |     /\  |\ | / _` |  |  /\  / _` |__  %c",10
  cinvoke printf,"\__, |  \ |___ /~~\  |  |___ |__/    \__/ .__/ | | \| \__>    /~~\ .__/ .__/ |___  |  | |__) |___  |     |___ /~~\ | \| \__> \__/ /~~\ \__> |___%c%c %c",10,10,10
  jmp gameLoop







gameLoop:

        call printBoard
        cinvoke printf, "Please enter your move: (1-9)?  "
        cinvoke scanf, "%d", Square
        inc [Counter]
        call placeX
        call computerMove
        call checkDraw
        call checkXWin
        call checkOWin
        jmp gameLoop





printBoard:




        cinvoke printf,"%c %1.1s | %1.1s | %1.1s %c",10, S1 , S2 , S3 , 10
        cinvoke printf, "---+---+---%c",10
        cinvoke printf," %1.1s | %1.1s | %1.1s %c", S4 , S5 , S6 , 10
        cinvoke printf, "---+---+---%c",10
        cinvoke printf," %1.1s | %1.1s | %1.1s %c", S7 , S8 , S9 , 10
        ret

placeX:
        cmp[Square], 1
        je placeX1
        cmp[Square], 2
        je placeX2
        cmp[Square], 3
        je placeX3
        cmp[Square], 4
        je placeX4
        cmp[Square], 5
        je placeX5
        cmp[Square], 6
        je placeX6
        cmp[Square], 7
        je placeX7
        cmp[Square], 8
        je placeX8
        cmp[Square], 9
        je placeX9

placeX1:
        cmp[S1],' '
        je placeX1go

placeX1go:
        mov [S1],'X'
        ret

placeX2:
        cmp[S2],' '
        je placeX2go

placeX2go:
        mov [S2],'X'
        ret

placeX3:
        cmp[S3],' '
        je placeX3go

placeX3go:
        mov [S3],'X'
        ret

placeX4:
        cmp[S4],' '
        je placeX4go

 placeX4go:
        mov [S4],'X'
        ret

placeX5:
        cmp[S5],' '
        je placeX5go

placeX5go:
        mov [S5],'X'
        ret

placeX6:
        cmp[S6],' '
        je placeX6go

placeX6go:
        mov [S6],"X"
        ret

placeX7:
        cmp[S7],' '
        je placeX7go

placeX7go:
        mov [S7],'X'
        ret

placeX8:
        cmp[S8],' '
        je placeX8go

placeX8go:
        mov [S8],'X'
        ret

placeX9:
        cmp[S9],' '
        je placeX9go

placeX9go:
        mov [S9],'X'
        ret


checkXWin:
       Row1Check:

                   cmp [S1],'X'
                   jne Row2Check

                   cmp[S2],'X'
                   jne Row2Check

                   cmp[S3],'X'
                   jne Row2Check

                   call printBoard
                   call Winner

       Row2Check:

                   cmp[S4] , 'X'
                   jne Row3Check

                   cmp[S5] , 'X'
                   jne Row3Check

                   cmp[S6] , 'X'
                   jne Row3Check

                   call printBoard
                   call Winner


       Row3Check:

                   cmp[S7] , 'X'
                   jne Column1Check

                   cmp[S8] , 'X'
                   jne Column1Check

                   cmp[S9] , 'X'
                   jne Column1Check

                   call printBoard
                   call Winner


       Column1Check:

                   cmp[S1] , 'X'
                   jne Column2Check

                   cmp[S4] , 'X'
                   jne Column2Check

                   cmp[S7] , 'X'
                   jne Column2Check

                   call printBoard
                   call Winner


       Column2Check:

                   cmp[S2] , 'X'
                   jne Column3Check

                   cmp[S5] , 'X'
                   jne Column3Check

                   cmp[S8] , 'X'
                   jne Column3Check

                   call printBoard
                   call Winner

       Column3Check:

                   cmp[S3] , 'X'
                   jne Diagonal1Check

                   cmp[S6] , 'X'
                   jne Diagonal1Check

                   cmp[S9] , 'X'
                   jne Diagonal1Check

                   call printBoard

                   call printBoard
                   call Winner

       Diagonal1Check:

                   cmp[S1] , 'X'
                   jne Diagonal2Check

                   cmp[S5] , 'X'
                   jne Diagonal2Check

                   cmp[S9] , 'X'
                   jne Diagonal2Check

                   call printBoard
                   call Winner


       Diagonal2Check:
                   cmp[S3] , 'X'
                   jne Hello

                   cmp[S5] , 'X'
                   jne Hello

                   cmp[S7] , 'X'
                   jne Hello

                   call printBoard
                   call Winner




Hello:
ret

computerMove:

        cinvoke time, 0    ;calls epoch time since jan 1970 and stores to eax register
        cinvoke srand, EAX          ;calling srand and passing the random value stored into EAX
        cinvoke rand    ;random int is returned to EAX
        mov EDX, 0
        mov EBX, 2
        idiv EBX        ;divide by 25 and put remainder in EDX
        inc EDX
        ;mov [A],EDX
       ; cinvoke printf, "Random number from 1-25: %d%c",[A], 10
         cmp EDX , 1
         je Move1
         cmp EDX , 2
         je Move2
         cmp EDX , 3
         je Move3
         cmp EDX , 4
         je Move4
         cmp EDX , 5
         je Move5


Move1:
        cmp[S5],' '
        je PlaceO5
        cmp[S1],' '
        je PlaceO1
        cmp[S3],' '
        je PlaceO3
        cmp[S7],' '
        je PlaceO7
        cmp[S4],' '
        je PlaceO4
        cmp[S6],' '
        je PlaceO6
        cmp[S2],' '
        je PlaceO2
        cmp[S8],' '
        je PlaceO8

Move2:
        cmp[S1],' '
        je PlaceO1
        cmp[S9],' '
        je PlaceO9
        cmp[S5],' '
        je PlaceO5
        cmp[S2],' '
        je PlaceO2
        cmp[S6],' '
        je PlaceO6
        cmp[S3],' '
        je PlaceO3
        cmp[S4],' '
        je PlaceO4
        cmp[S7],' '
        je PlaceO7
        cmp[S8],' '
        je PlaceO8


Move3:
       cmp[S2],' '
        je PlaceO1
        cmp[S3],' '
        je PlaceO9
        cmp[S5],' '
        je PlaceO5
        cmp[S7],' '
        je PlaceO2
        cmp[S6],' '
        je PlaceO6
        cmp[S1],' '
        je PlaceO3
        cmp[S9],' '
        je PlaceO4
        cmp[S4],' '
        je PlaceO7
        cmp[S8],' '
        je PlaceO8

Move4:
       cmp[S3],' '
        je PlaceO3
        cmp[S5],' '
        je PlaceO9
        cmp[S4],' '
        je PlaceO5
        cmp[S6],' '
        je PlaceO2
        cmp[S7],' '
        je PlaceO6
        cmp[S1],' '
        je PlaceO3
        cmp[S8],' '
        je PlaceO4
        cmp[S2],' '
        je PlaceO7
        cmp[S9],' '
        je PlaceO8

Move5:

        cmp[S3],' '
        je PlaceO1
        cmp[S1],' '
        je PlaceO9
        cmp[S5],' '
        je PlaceO5
        cmp[S7],' '
        je PlaceO2
        cmp[S9],' '
        je PlaceO6
        cmp[S2],' '
        je PlaceO3
        cmp[S4],' '
        je PlaceO4
        cmp[S6],' '
        je PlaceO7
        cmp[S8],' '
        je PlaceO8

PlaceO1:
        mov [S1],'O'
        ret

PlaceO2:
        mov [S2],'O'
        ret

PlaceO3:
        mov [S3],'O'
        ret

PlaceO4:
        mov [S4],'O'
        ret

PlaceO5:
        mov [S5],'O'
        ret

PlaceO6:
        mov [S6],'O'
        ret

PlaceO7:
        mov [S7],'O'
        ret

PlaceO8:
        mov [S8],'O'
        ret

PlaceO9:
        mov [S9],'O'
        ret


checkOWin:
       RowCheck1:

                   cmp [S1],'O'
                   jne RowCheck2

                   cmp[S2],'O'
                   jne RowCheck2

                   cmp[S3],'O'
                   jne RowCheck2

                   call printBoard
                   call Loser

       RowCheck2:

                   cmp[S4] , 'O'
                   jne RowCheck3

                   cmp[S5] , 'O'
                   jne RowCheck3

                   cmp[S6] , 'O'
                   jne RowCheck3

                   call printBoard
                   call Loser


       RowCheck3:

                   cmp[S7] , 'O'
                   jne ColumnCheck1

                   cmp[S8] , 'O'
                   jne ColumnCheck1

                   cmp[S9] , 'O'
                   jne ColumnCheck1

                   call printBoard
                   call Loser


       ColumnCheck1:

                   cmp[S1] , 'O'
                   jne ColumnCheck2

                   cmp[S4] , 'O'
                   jne ColumnCheck2

                   cmp[S7] , 'O'
                   jne ColumnCheck2

                   call printBoard
                   call Loser


       ColumnCheck2:

                   cmp[S2] , 'O'
                   jne ColumnCheck3

                   cmp[S5] , 'O'
                   jne ColumnCheck3

                   cmp[S8] , 'O'
                   jne ColumnCheck3

                   call printBoard
                   call Loser

       ColumnCheck3:

                   cmp[S3] , 'O'
                   jne DiagonalCheck1

                   cmp[S6] , 'O'
                   jne DiagonalCheck1

                   cmp[S9] , 'O'
                   jne DiagonalCheck1

                   call printBoard
                   call Loser

       DiagonalCheck1:

                   cmp[S1] , 'O'
                   jne DiagonalCheck2

                   cmp[S5] , 'O'
                   jne DiagonalCheck2

                   cmp[S9] , 'O'
                   jne DiagonalCheck2

                   call printBoard
                   call Loser


       DiagonalCheck2:
                   cmp[S3] , 'O'
                   jne Hello1

                   cmp[S5] , 'O'
                   jne Hello1

                   cmp[S7] , 'O'
                   jne Hello1

                   call printBoard
                   call Loser




Hello1:
ret




Winner:

  cinvoke printf,"%c%c%c%c%c%c",10,10,10,10,10,10
  cinvoke printf,"            .--                                                       %c ",10
  cinvoke printf,"      ==-   .\#\                                                      %c ",10
  cinvoke printf,"         ,-._\\ \=- .                                                 %c ",10
  cinvoke printf,"         |#___\ \_)                                                 %c ",10
  cinvoke printf,"  =--      '  \\\#\                                                   %c ",10
  cinvoke printf,"     ==--      \`--'                                                   %c ",10
  cinvoke printf,"                ""         .--                                         %c ",10
  cinvoke printf,"                    ==--   .\#\                                       %c ",10
  cinvoke printf,"                        ,-._\\ \=- .               )                   %c ",10
  cinvoke printf,"                 ==-    |#___\ \_)              (                    %c ",10
  cinvoke printf,"                          '  \\\#\                 ))                  %c ",10
  cinvoke printf,"                       ==-    \`--'               ((                   %c ",10
  cinvoke printf,"                               ""                  ))                  %c ",10
  cinvoke printf,"     ______________                __              (  __               %c ",10
  cinvoke printf,"   ,'              `.            ('__`>           , ) __`.              %c ",10
  cinvoke printf,"  /                  \____       /==(^)     ______ ( -'_--`.             %c ",10
  cinvoke printf,"  |  VICTORY!!!      ,-'        `\_-/    |()|::::)= '_`.  .             %c ",10
  cinvoke printf,"  |  VICTORY!!!        |     _____ / /\  /)____||____\_-``.                 %c ",10
  cinvoke printf,"  |  WOHOOOO!!!      `-------'            \-`   ,              %c ",10
  cinvoke printf,"  \                  /      &  ,   .  &  ,   .  &  ,   | '                     %c ",10
  cinvoke printf,"   `.______________,'       _\'     `/_\'     `/_\'    |                     %c ",10
  cinvoke printf,"                            _|`.   ,'|_|`.   ,'|_|`.   |                      %c ",10
  cinvoke printf,"                                                        |\                   %c ",10
  cinvoke printf,"                            __________________________/__\                     %c ",10
 cinvoke printf,"                                                     .`.-_-\                     %c ",10
 cinvoke printf,"                                                    `_`.'_-_\                 %c ",10
 cinvoke printf,"                                                       -- -                      %c ",10
 cinvoke printf,"                                                                                   %c ",10
 cinvoke printf,"                           !                                   !                 %c ",10
 cinvoke printf,"                         !!                        !!         !                %c ",10
 cinvoke printf,"                        e                        !!          e       .            %c ",10
 cinvoke printf,"                       e                        e           E       )               %c ",10
 cinvoke printf,"                     ee                        e           E     : ( .             %c ",10
 cinvoke printf,"                    e      ;                  E          EE      ,))              %c ",10
 cinvoke printf,"                  EE        )               EE          E        ((              %c ",10
 cinvoke printf,"                 E         ( .             E            e    . ))) :             %c ",10
 cinvoke printf,"               EE      . ,))              E     ;  .   e    \(((( .              %c ",10
 cinvoke printf,"             EE        ))               EE        )          \))                %c ",10
 cinvoke printf,"            E         ((  .            E      . ((       ____((|____           %c ",10
 cinvoke printf,"           E        : (((             E       ))        |_@__| |__@_|.            %c ",10
 cinvoke printf,"         ee      ((( , )))           e      .((  ;       '---| |-----'             %c ",10
 cinvoke printf,"        e       , ))))/             E     :  )               \_/                  %c ",10
 cinvoke printf,"                   ((/             E        (                `~                 %c ",10
 cinvoke printf,"               ____|))____       ee     _, ))                                    %c ",10
 cinvoke printf,"             .|_@__| |__@_|            \ |((                                       %c ",10
 cinvoke printf,"             '-----| |---'              |)));                                      %c ",10
 cinvoke printf,"                   \_/                ;((((                                      %c ",10
 cinvoke printf,"                   ;~'              ____))|____                                   %c ",10
 cinvoke printf,"                                   |_@__| |__@_|.                                 %c ",10
 cinvoke printf,"                                    '---| |-----'                                %c ",10
 cinvoke printf,"                                        \_/                                      %c ",10
 cinvoke printf,"                                        `~;                                     %c ",10
 jmp Ending
 ret


Loser:
   cinvoke printf,"                .____,    |            |    ____   .     %c " ,10
   cinvoke printf,"               . \  / ,  |            |  ,' __ `.;     %c " ,10
   cinvoke printf,"               |`-  -'|  |            | / ,'  ..'\    %c  " ,10
   cinvoke printf,"              |,-  - |  |            | | | ; | |    %c " ,10
   cinvoke printf,"               ' /__\ `  |            | \ ;'__,' /   %c  " ,10
   cinvoke printf,"                '    `  |            |  :.____,'    %c  " ,10
   cinvoke printf,"            ____________|____________|_._____________%c  " ,10
   cinvoke printf,"               .____,   |    ____    :'             %c  " ,10
   cinvoke printf,"              . \  / ,  |  ,' __ ... |              %c  "  ,10
   cinvoke printf,"              |`-  -'|  | / ,' : . \ |             %c   " ,10
   cinvoke printf,"             |,-  -.|  | | |..) | | |              %c  " ,10
   cinvoke printf,"              ' /__\ `  | \ ;.__,' / |               %c " ,10
   cinvoke printf,"               '    `    | . .____,'  |              %c  " ,10
   cinvoke printf,"           _____________:'___________|_______________%c " ,10
   cinvoke printf,"                 ____    |            |   .____,      %c " ,10
   cinvoke printf,"               ,' __ `:  |            |  . \  / ,     %c " ,10
   cinvoke printf,"              / ,'  .  \ |            |  |`-  -'|      %c " ,10
   cinvoke printf,"              | | .; | | |            |  |,-  -.|      %c ",10
   cinvoke printf,"              \ .:__,' / |            |  ' /__\ `     %c " ,10
   cinvoke printf,"               :.____,'  |            |   '    `     %c  " ,10
   cinvoke printf,"             :          |            |               %c " ,10
   cinvoke printf,"          .'                                          %c " ,10


cinvoke printf,"           __   ___    ___  __          __       ___         __                __   __  ___   /  /    %c " ,10
cinvoke printf,"   |\ | | /  ` |__      |  |__) \ /    |__) |  |  |     \ / /  \ |  |    |    /  \ /__`  |   /  /         %c " ,10
cinvoke printf,"   | \| | \__, |___     |  |  \  |     |__) \__/  |      |  \__/ \__/    |___ \__/ .__/  |  .  .         %c " ,10
cinvoke printf," __              ___     __        ___  __    /  /                                                                         %c " ,10
cinvoke printf,"/ _`  /\   |\/| |__     /  \ \  / |__  |__)  /  /                                                                            %c " ,10
cinvoke printf,"\__> /~~\  |  | |___    \__/  \/  |___ |  \ .  .      %c " ,10





   jmp Ending
   ret



checkDraw:

    cmp[Counter],5
    je Draw
    ret

Draw:

 call printBoard
 cinvoke printf,"      __  ___     __        __    /  /     ___ .  __              __   __              /  /  %c",10
 cinvoke printf,"|\ | /  \  |     |__)  /\  |  \  /  /    |  |  ' /__`     /\     |  \ |__)  /\  |  |  /  /      %c",10
 cinvoke printf,"| \| \__/  |     |__) /~~\ |__/ .  .     |  |    .__/    /~~\    |__/ |  \ /~~\ |/\| .  .         %c",10



    jmp Ending
    ret





Ending:
        invoke Sleep,-1












;======================================
section '.data' data readable writeable
;======================================

S1     db ' '
S2     db ' '
S3     db ' '
S4     db ' '
S5     db ' '
S6     dd ' '
S7     db ' '
S8     db ' '
S9     db ' '
Counter dd 0


;======================================
section '.bss' data readable writeable
;======================================
Square rb 1




;====================================
section '.idata' import data readable
;====================================
library msvcrt,'msvcrt.dll',kernel32,'kernel32.dll'
import msvcrt,printf,'printf',scanf,'scanf',time,'time',rand,'rand',srand,'srand',cls,'cls'
import kernel32,Sleep,'Sleep'