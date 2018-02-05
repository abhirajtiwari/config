dir=$(ls -a $HOME | rofi -i -p finder:\  -dmenu -lines 8 -eh 2 -width 60 -padding 50 -opacity "90" -bw 0 -bc "#2f343f" -bg "#2f343f" -fg "#f3f4f5" -hlbg "#2f343f" -hlfg "#9575cd    " -font "System San Francisco Display 14") 
od=$HOME
dir=$HOME/$dir
echo $dir
while true; do
	if [ -d $dir ]
	then
		od=$dir
		i=$(""ls -a $od | rofi -p finder:\  -i -dmenu -lines 8 -eh 2 -width 60 -padding 50 -opacity "90" -bw 0 -bc "#2f343f" -bg "#2f343f" -fg "#f3f4f5" -hlbg "#2f343f" -hlfg "#9575cd    " -font "System San Francisco Display 14")
		dir=$dir/$i
        else	
		exec xdg-open "$dir" &	
		exit
	fi
done
