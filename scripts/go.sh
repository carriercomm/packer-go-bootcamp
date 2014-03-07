SRCROOT="/opt/go"

# Install Go
apt-get install -y build-essential mercurial
hg clone -u release https://code.google.com/p/go ${SRCROOT}
cd ${SRCROOT}/src
./all.bash

# Setup the GOPATH
mkdir -p /opt/gopath
cat <<EOF >/tmp/gopath.sh
export GOPATH="/opt/gopath"
export PATH="/opt/go/bin:\$GOPATH/bin:\$PATH"
EOF
mv /tmp/gopath.sh /etc/profile.d/gopath.sh
chmod 0755 /etc/profile.d/gopath.sh

# Make sure the gopath is usable by bamboo
chown -R vagrant:vagrant $SRCROOT
chown -R vagrant:vagrant /opt/gopath

# Install git
apt-get install -y git-core
