export SCRIPTHOME="$(basename -- $PWD)"

bash ./input.sh
source ./setup.conf
echo "SCRIPTHOME=$SCRIPTHOME" >> ./setup.conf
bash ./base.sh
runuser -u $username -- /home/$username/$SCRIPTHOME/extended.sh
bash ./cleanup.sh
