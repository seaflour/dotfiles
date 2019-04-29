#!/usr/bin/expect -f

set prompt "#"
set address [lindex $argv 0]
spawn sudo bluetoothctl -a
expect -re $prompt
send "remove $address\r"
sleep 1
expect -re $prompt
send "scan on\r"
send_user "Set device to pairing mode"
interact {
	\r	{send_user "Attempting to pair"}
}
send "scan off\r"
expect "Controller"
send "trust $address\r"
sleep 2
send "pair $address\r"
sleep 2
send "0000\r"
sleep 3
send_user "\nDone.\r"
send "quit\r"
expect eof
