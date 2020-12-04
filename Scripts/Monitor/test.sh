#!/bin/bash

echo "yes"
value=666
yad --scale \
      --borders=30 \
      --geometry=410x100+1400+0 \
      --image=/usr/share/icons/Flat-Remix-Blue-Dark/actions/scalable/xfpm-brightness-lcd.svg \
      --max-value=24242 \
      --no-buttons \
      --no-focus \
      --print-partial \
      --skip-taskbar \
      --text 'Brightness' \
      --text-align=center \
      --timeout=3 \
      --value=$value \
      --undecorated \
      --mark=0:1 \
      --mark=10:2424 \
      --mark=20:4848 \
      --mark=30:7272 \
      --mark=40:9696 \
      --mark=50:12120 \
      --mark=60:14544 \
      --mark=70:16968 \
      --mark=80:19392 \
      --mark=90:21816 \
      --mark=100:24242 \
      / | while read BrNew
   do echo "$BrNew";
   done 


exit;


      --mark=:2 \
      --mark=:3 \
      --mark=:4 \
      --mark=:5 \
      --mark=:6 \
      --mark=:7 \
      --mark=:8 \
      --mark=:9 \
      --mark=:10 \
      --mark=:30 \
      --mark=:40 \
      --mark=:50 \
      --mark=:60 \
      --mark=:70 \
      --mark=:80 \
      --mark=:90 \
      --mark=:100 \
      --mark=:200 \
      --mark=:300 \
      --mark=:400 \
      --mark=:500 \
      --mark=:600 \
      --mark=:700 \
      --mark=:800 \
      --mark=:900 \
      --mark=:1000 \
      --mark=10%:2424 \
      --mark=:3000 \
      --mark=:4000 \
      --mark=:5000 \
