# short test suite for a single node
# to execute:
# git clone https://github.com/HVKHCM/CURI2021-Raspberry-Pi.git stest; stest/test1.sh

cd /home/pi/stest

./patch.sh || { echo "patch.sh failed" ; exit 1; }

./runtest.sh || { echo "runtest.sh failed" ; exit 1; }

sudo worker-node 

ls | diff - pi-ls.out && echo "pi home directory remains unchanged" && {
	cd .. ; rm -rf stest ; }
