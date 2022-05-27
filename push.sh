echo "Start submitting code to the local repository"
echo "The current directory is：$(pwd)"
git add *
echo;
 
 
 
echo "Commit the changes to the local repository"
echo "please enter the commit info...."

message=$0

if test -z message
then 
  read message
fi


git commit -m "Update README.md  $message"

echo;

echo $message 

echo "Commit the changes to the remote git server"
git push
echo;
 
echo "Batch execution complete!"


