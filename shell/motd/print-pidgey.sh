#!/bin/sh
#	/etc/profile.d/motd.sh
#	Print the "Message of the day" 

cat << EOF
Welcome to...
                                                                                
                         ./+                                                    
                /    .:+sho\`                                                    
               +y:-+ssosh/-:://\`           OS:              $(lsb_release -s -d)
             /h+/hsooooyysoshdho\`          Kernel:          $(uname -r)                               
            //yssoooooooosshho/:://\`       Hostname:        $(hostname)                                  
           +:+hsooossso+/:-..\`\`\`+s:\`       User:            $(whoami)         
         \`s/yhyyhhho+o+///++/////:/os:     Uptime:          $(uptime -p | sed 's/up //g')        
    \`://+++oosyy:/ysMMm\`\`.mNyoooy+\`\`..     Date:            $(date)
  \`+o///:.....-y\` \`\`:ys::dNNNhoooy+        Load Averages:   $(cat /proc/loadavg | awk '{print $1", "$2", "$3" (1, 5, 15 minutes)"}')             
 \`o+osdddhs/:--/s    \`.+hNNmmNmsooy:       Processes:       $(ps -ef | wc -l)
      .sddddyo//h.      \`-yNmmNmyooh.      Memory:          $(cat /proc/meminfo | grep MemFree | awk '{print $2}') / $(cat /proc/meminfo | grep MemTotal | awk '{print $2}') KB
        -hmdddhsy/        \`mNmNmsoosy                                           
         +doyys+s\`        oNNmyoooooso\`                                         
      \`/hmyo/:+s\`        +Ndyoooooooosso/-\`                                     
      ohs+/+os+-\`       -hsoooooooooooooooso/.                                  
       ...-+o-..\`      .+ooooooooooooooooooosss/\`                               
          .o-...       -oooooooooooooooooooooooss+-                             
         .o...\`        \`/ooooosoooooooooooooooooooss/\`                       \`  
        \`o\`\`\`           \`:oooohsooooooooooooooooooooyy/\`                 .-/oy/ 
        +.                .+oodooooooooooooooooooooymhso.            \`-/oosooh\` 
       :/                  \`/odooooooooooooooooooooy-/..o.        .:ossoooooy:  
      \`s\`                   \`-doooooooooooooooooosh.    \`o\`    \`-ossoooooooy+   
      /:                     \`dooooooooooooosyyssmy\`     .o  \`/ssssooooosss+    
      s\`                  \`\`  yooyyoooooooooyss.+d-       ///yyyyysssyyhs-\`     
      s\`o     :           .s\`\`-homNdsdsoooooh.\`  ..     /\`\`hhyyhhhhyyyhs-.      
     .o/m-   \`m\`     .  .  y-.\`:yd/y+dyshdysh\`          -o\`:mdddhysssssssh:     
     \`osys   \`Ny-   \`y\` s: o:...:h+.\`-y//o.\`.            y.\`dyyyyysoooooy+      
     \`o+sh   \`dmh\`   ++ /h\`+/....-++. \`-                 +/.y///++o+++oo-       
        ./:-..hym:   .m\`/y+o:......:o/.\`\`       \`\`     \`/\`y.y                   
           .-+y/ys-.--ho+:oy-........:+/-.\`\`\`   .o-\`    s.s:s                   
              -+/-:/::::/..............:++:-..\`\`\`-o+.\`  -s:d/                   
             \`\`\`:+/......................-/+/--..../s:\`\` s:h\`                   
       \`\`\`--o+////o+//-.....................:+++:--.-o+.\`.ss.                   
     -oo++:--yooo+/ooso//++++//:---------://++/+o///+/oy:-y:                    
     :-...:+soo+::++++:::/+ossdhyys:::/dhdd.         \`.-::.                     
         -oo///hooso///+syy//+oooosooo/:--oo:.\`\`...\`                            
         :-\`   \`..   .++:-+ds-://+++/:/:..:/+ooooooy/:\`                         
                    oy/+ho:.:y/ssoo//+/-:/oooooooooys/s/                        
                    . +y//:::oho:-o+:/oo/:.\`\`\`  \`\`\`\` \`.-                        
                     ./\`    -+\`\`:/+so+.                                         
                           -o:/:.                                               
                           h/\`                                                  

EOF
