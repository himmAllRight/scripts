#!/bin/sh
#	/etc/profile.d/motd.sh
#	Print the "Message of the day" 

cat << EOF
Welcome to...
              _.--""\`-..          OS:              $(lsb_release -s -d)
            ,'          \`.        Kernel:          $(uname -r)
          ,'          __  \`.      Hostname:        $(hostname)
         /|          " __   \     User:            $(whoami)    
        , |           / |.   .    Uptime:          $(uptime -p | sed 's/up //g') 
        |,'          !_.'|   |    Date:            $(date)
      ,'             '   |   |    Load Averages:   $(cat /proc/loadavg | awk '{print $1", "$2", "$3" (1, 5, 15 minutes)"}')  
     /              |\`--'|   |    Processes:       $(ps -ef | wc -l)
    |                \`---'   |    Memory:          $(cat /proc/meminfo | grep MemFree | awk '{print $2}') / $(cat /proc/meminfo | grep MemTotal | awk '{print $2}') KB
     .   ,                   |                       ,.
      ._     '           _'  |                    , ' \ \`
  \`.. \`.\`-...___,...---""    |       __,.        ,\`"   L,|
  |, \`- .\`._        _,-,.'   .  __.-'-. /        .   ,    \

-:..     \`. \`-..--_.,.<       \`"      / \`.        \`-/ |   .
  \`,         """"'     \`.              ,'         |   |  ',,
    \`.      '            '            /          '    |'. |/
      \`.   |              \       _,-'           |       ''
        \`._'               \   '"\                .      |
           |                '     \                \`._  ,'
           |                 '     \                 .'|
           |                 .      \                | |
           |                 |       L              ,' |
           \`                 |       |             /   '
            \                |       |           ,'   /
          ,' \               |  _.._ ,-..___,..-'    ,'
         /     .             .      \`!             ,j'
        /       \`.          /        .           .'/
       .          \`.       /         |        _.'.'
        \`.          7\`'---'          |------"'_.'
       _,.\`,_     _'                ,''-----"'
   _,-_    '       \`.     .'      ,\

   -" /\`.         _,'     | _  _  _.|
    ""--'---"""""'        \`' '! |! /
                            \`" " -' mh


EOF
