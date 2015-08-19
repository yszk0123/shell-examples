# cf. [bash - How do I prompt for input in a Linux shell script? - Stack Overflow](http://stackoverflow.com/questions/226703/how-do-i-prompt-for-input-in-a-linux-shell-script)

while true; do
  read -p 'Enter [YyNn]' yn
  case $yn in
    [Yy]* ) echo 'yes'; break ;;
    [Nn]* ) echo 'no'; break ;;
    * ) echo 'Please answer yes or no.' ;;
  esac
done

select yn in 'Yes' 'No'; do
  case $yn in
    Yes ) echo 'yes' ;;
    No ) echo 'no' ;;
  esac
done
