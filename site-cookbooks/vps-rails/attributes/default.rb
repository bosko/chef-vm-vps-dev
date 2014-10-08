default.packages = %w{ vim emacs git build-essential zlib1g-dev libssl-dev
 libreadline-dev libyaml-dev libcurl4-openssl-dev curl libffi-dev autoconf
 libreadline6 libxml2-dev libxslt1-dev openssl htop
 libpcre3 libpcre3-dev redis-server memcached }

default.authorization.sudo.users = ["deployer"]
default.authorization.sudo.passwordless = true

default.openssh.server.permit_root_login = 'no'
default.openssh.server.password_authentication = 'no'
default.openssh.server.allow_users = ["deployer"]
default.openssh.server.port = 28820
