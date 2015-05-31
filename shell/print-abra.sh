#!/bin/sh

cat << EOF
Welcome to...
                                                      _               
                                                /\   | |              
                                               /  \  | |__  _ __ __ _ 
                                              / /\ \ | '_ \| '__/ _\` |
                                             / ____ \| |_) | | | (_| |
                                            /_/    \_|_.__/|_|  \__,_|
                    
                                                        _
                                                   _, -"'|   Os:              $(lsb_release -i -s) Linux
                                               _.-'   ,'j    Kernel:          $(uname -r)
                       ____           _,.....-'      /  |    Hostname:        $(hostname)
                      \`.   \`'--..,--"'              .   |    User:            $(whoami)
                       \`.                           |   |    Uptime:          $(uptime -p | sed 's/up //g')
                        .\`.                         \  j     Date:            $(date)
                _.,     '  .                         \` |     Load Averages:   $(cat /proc/loadavg | awk '{print $1", "$2", "$3" (1, 5, 15 minutes)"}')  
              .','       . |                            \\    Processes:       $(ps -ef | wc -l)
            ," /         \`./                             \\   Memory:          $(cat /proc/meminfo | grep MemFree | awk '{print $2}') / $(cat /proc/meminfo | grep MemTotal | awk '{print $2}') KB
           /  /           /                    ,-'        \\  Battery:         $(upower -i $(upower -e | grep BAT) | grep --color=never -E percentage|xargs|cut -d' ' -f2|sed s/%//)%
         ,'  j           j  .._              ,'            L._
        /    |           |     \`.          ,'             ,'  \`-.
       .     |           |       \`.       .            _,'       \`.
       |     |           \`.        \`               _,-'            \

       |     \`           / \`-.                  ,"/                \`. 
       |    _.\         j     \`-.._       ,   .' |                  ;
       '  ,'   \        |        _,'.    '  ,'    \`.              .'
        +'   ,.-^.      \`-..,..-'/ _,^-----+.       \`._       _,-'
        .+--\`._   \`-._     L_   j-"          \`-.  _,-\ \`..,--'
          \    \`      \`"-+'  \`-.'               "" ,.'/ \` |      ,
_____      L    \`       /       \`.._.----.._   _.-'  /   F     ,'|
\`.   \`.    |     \     '.           \`"""-+.-\`"'     '    |\`. ,'  |
  \`.   \`.  |      L   _,+\__              \`          \   |/ /    |
    \    +,'      |  '     \`.\`._           \`.         |  |.,     |
    \`.  '         |,"        \  \`.          |.      _,|         /
      \`           |           |   +.       / | _,-+'  |        /
       \          |          '    |\.     /-',"  /    |       j
        \         |         /_    | \\\`..,-"."   |     j       |
         \         \ _   _,'  \`-.  \`-,|/___.\,-.|    /        '
         \`         \`' """        \`""'            \  |        .
          \`. ,""'   |                             \`-+\`./     |
            \`.     '                                  |      F
              )   |                                    \    /
             /__,.'                                     \,.' mh

EOF



