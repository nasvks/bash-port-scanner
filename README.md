# bash-port-scanner
Almost a pure Bash port scanner

## Notes
After seeing a couple of posts on LinkedIn by people claiming to have written port scanners in Bash, I decided to see whether I could write a basic port scanner in nothing but Bash. This *might* be useful if you find yourself on a box that doesn't have a port scanner installed and you don't have the required privileges to install packages.

## Usage
Execute ``bash scan.sh --host <ip-address> [--ports <port1,port2>]`` to run a scan.

## Todo
* Replace ``sleep 1`` with something like ``read -t 1``
* ~~Add option to use /etc/services as port list~~
* Add option to accept IP ranges in CIDR notation
