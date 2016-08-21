echo "Enter the Username"
read loginname

n=`grep -i -c $loginname /etc/passwd`
if [ $n -ne 0 ]
then
	echo "wait ..."
else
	echo "Wrong username"
	exit
fi
time=0

while true
do
	who|grep -i $loginname >> /home/ankit/garbage
	if [ $? -eq 0 ]
	then
		if [ $time -gt 60 ]
		then
			min=`expr $time / 60`
			sec=`expr $time % 60`
			echo "$loginname is $min minutes and $sec seconds late"
			exit
		else
			echo "$loginname is $time seconds late"
			exit
		fi
	else
		time=`expr $time + 1`
		sleep 1
	fi


done


