while true;
do
  inotifywait -e close_write -r ./docs/documentation.md 
  catlight rgb 255 0 255 
  make 
  if [ $? = 0 ]; then
      catlight rgb 0 255 0
  else
      catlight rgb 255 0 0
  fi

done
