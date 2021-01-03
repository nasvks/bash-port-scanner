# bash-port-scanner
Almost a pure Bash port scanner

## Usage
Execute ``bash scan.sh --host <ip-address> [--ports <port1,port2>]`` to run a scan.

## Todo
* Replace ``sleep 1`` with something like ``read -t 1``
* ~~Add option to use /etc/services as port list~~
* Add option to accept IP ranges in CIDR notation
