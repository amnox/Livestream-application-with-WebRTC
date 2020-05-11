args=("$@")
#echo "First->"  ${args[0]}
#echo "Second->" ${args[1]}

# Print usage
usage() {
  echo -n "
 Options:
  [Network Bridge]: ID of the network bridge to run the tests on.
  [mode]: Possible values
          - delay
          - packet_loss
          - bandwidth
          - reset
"
}

delay(){
  echo "sudo tc qdisc add dev ${1} root netem delay 50ms 25ms 25%"
  sudo tc qdisc add dev ${1} root netem delay 50ms 25ms 25%
}

packet_loss(){
  echo "sudo tc qdisc add dev ${1} root netem loss 15%"
  sudo tc qdisc add dev ${1} root netem loss 15%
}

bandwidth(){
  echo "sudo tc qdisc add dev ${1} root tbf rate 128kbit burst 1600 limit 3000"
  sudo tc qdisc add dev ${1} root tbf rate 128kbit burst 1600 limit 3000
}

cleanup(){
  echo "sudo tc qdisc del dev ${1} root"
  sudo tc qdisc del dev ${1} root
}

error_occured(){
  cleanup $1
  usage
  die "invalid arguements provided"

}

if [ $# -lt 2 ]; then
    usage
    exit 1
fi


if [ "$2" == "delay" ]
then
  delay $1
elif [ "$2" == "packet_loss" ]
then
  packet_loss $1
elif [ "$2" == "bandwidth" ]
then
  bandwidth $1
elif [ "$2" == "reset" ]
then
  cleanup $1
else
  error_occured $1
fi
