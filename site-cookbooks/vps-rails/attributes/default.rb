default.packages = %w{ vim emacs git build-essential }

default.authorization.sudo.users = ["deployer"]
default.authorization.sudo.passwordless = true

default.openssh.server.permit_root_login = 'no'
default.openssh.server.password_authentication = 'no'
default.openssh.server.allow_users = ["deployer"]
default.openssh.server.port = 28820
