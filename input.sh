# Remove existing ./setup.conf
rm -rf ./setup.conf &>/dev/null

# # User input
# echo "Please enter a username:"
# read username
# echo "username=$username" >> ./setup.conf

username () {
if ! ./setup.conf; then
	# Loop through user input until the user gives a valid username
	while true
	do
		read -p "Please enter username: " username
		# username regex per response here https://unix.stackexchange.com/questions/157426/what-is-the-regex-to-validate-linux-users
		# lowercase the username to test regex
		if [[ "${username,,}" =~ ^[a-z_]([a-z0-9_-]{0,31}|[a-z0-9_-]{0,30}\$)$ ]]
		then
			break
		fi
		echo "Incorrect username."
	done

# convert name to lowercase before saving to install.conf
echo "username=${username,,}" >> ./setup.conf
fi
}

# echo "Please enter a password for $username:"
# read -s password
# echo "password=$password" >> ./setup.conf

password () {

while true
do
    echo "Please enter a password for $username: "
	read -s password1

    if [[ ! -z $password1 ]]; then
        echo "And one more time for verification: "
		read -s password2

        # Check if passwords match
        if [[ $password1 = $password2 ]]; then
            break
        else
            echo "Passwords don't match!"
        fi
    fi
done
echo "password=$password1" >> ./setup.conf
}

aur_software () {
echo -ne "
Please enter your choice of AUR helper:
0.)      Paru (default)
1.)      Yay
"

echo -ne "\nAUR helper choice: $input_helper"
read input_helper

case $input_helper in
0) echo "aur_helper=paru" >> ./setup.conf;;
1) echo "aur_helper=yay" >> ./setup.conf;;
*) echo "aur_helper=paru" >> ./setup.conf;;
esac
}

# Run input function(s)
username
password
aur_software
