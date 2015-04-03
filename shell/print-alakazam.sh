#!/bin/sh
#	/etc/profile.d/motd.sh
#	Print the "Message of the day" 

cat << EOF
Welcome to...
                                             _       _                            
                                       /\   | |     | |                           
                                      /  \  | | __ _| | ____ _ ______ _ _ __ ___  
                                     / /\ \ | |/ _\` | |/ / _\` |_  / _\` | '_ \` _ \ 
                                    / ____ \| | (_| |   < (_| |/ / (_| | | | | | |
                                   /_/    \_\_|\__,_|_|\_\__,_/___\__,_|_| |_| |_|
             //-                                     ::              
              +///-                               -+oy\`              
               /:\`-//.                         -////s.               
                //\`\`.oo/\`                   \`/+--/oy\`                
                 :/\`\`:/+s+\`               \`//.\`:+yo                  
                  -+\`-////o+.           \`//\`\`./oy+       OS:              $(lsb_release -s -d)
                   -+.//////oo\`       \`/o:::/+sh:        Kernel:          $(uname -r)
                    .o//////+osoooooo+o/////+sh:         Hostname:        $(hostname)
                     -y///so:.\`\`-//////////osy/          User:            $(whoami)            
                     -h//o.\`\`\`\`.///////+///ssd-\`         Uptime:          $(uptime -p | sed 's/up //g') 
                 \`/syyh/o+\`\`\`\`:////////+s+/+smmms-       Date:            $(date)
               -ohyssho///-\`\`./////////+ss//+smhsho\`     Load Averages:   $(cat /proc/loadavg | awk '{print $1", "$2", "$3" (1, 5, 15 minutes)"}')        
              +hyysos+//+y//:://///////+hs////+yysyd.    Processes:       $(ps -ef | wc -l)
             :hyhs+--////oho//////////+hy///////+yyyh\`   Memory:          $(cat /proc/meminfo | grep MemFree | awk '{print $2}') / $(cat /proc/meminfo | grep MemTotal | awk '{print $2}') KB
             .hhhssyyyys+/y/ys////+o+hoh+/////-..-hyy+               
              .mhyyhhhddmdsooyh///dyyyo+osyhhhddmmddd:   
             .ssshddmdddmmmh//h//+dss/smmmmmdddmmmh:\`                
            :s/os:\` ./ydddddy/y+/syshshdmdmms/mysso                  
           \`y/o+    .s+/+hddmoos+dssmdy+ym:\`  \`+o/s:                 
           o+/y    :s//+h.ymmh/oshsdmddm/+y-    -s/s/                
          \`y/o+   .y//+y/  sosys+hdmmdd/y//s:    -s/so-              
         /hhshyy  y///sh.  ys\`.:/+/ssyd s+//o/    -dysyy/            
         oy/+syy:sysossh \`+yys\`\`://shhyo/y///o+:::/dyssyhy.          
      \`s+/\`\`-://+sssssyhoo//shy://oydy+/+h+////.\`\`\`\`\`\`\`:+dm-         
      \`ys-\`\`\`-///sssssd+/o+/:\`.y+osy \`:+o+d+/////:----:+dysd:        
      \`s-//\`\`-///+ssydyyo\`     -oo/\`    \`:ydo+/////////+dsshm-       
      ::hdso:/+yhyhhhdmh/                 \`dhhhhhyyyo+ydmshmmd\`      
        hsssyydmNssssdddm\`                hyssyyyyhhd\`.dsssyddh      
       \`dssssshdmhhhdhhyh/                smddh\`\`..:o:\`dssssddm/     
       \`hysssshdm:s+/++//s:               \`hhmm-\`\`.::s:dhyydMNmd     
   \`     yhyhdmy. \`y//////o+\`            ..y+oyhs+:/+/sdsdo/yMms     
 ++:///-sosydhsh- /h////////hh.          /ho+d+ho+++ohyssdo/odh+\`    
:/ \`..:ssohdysdss+odsoo/////y.            +osy/+sssshydhhyo+yd/+s    
\`s-..-/odsohhomyomsymso+oo+/-              h///++///oyyyysdhhs+yo:\`  
  :////-hsdyhdydh+:./+//\`                 /o//+syoo+//oo. ./oyy+sdh  
         :+ooo\`\`\`   \`.                    ++/+oss  s+//+y\`      ./\`  
                                          \`/y:ys.   ++yo/s           
                                            ++-        \`-:           
EOF
