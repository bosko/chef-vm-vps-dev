default.packages = %w{ vim emacs }

default.vps_rails.deploy_user = "deployer"
default.vps_rails.ruby_version = "2.1.2"

default.authorization.sudo.users = ["deployer"]
default.authorization.sudo.passwordless = true

default.rbenv.group_users = ["deployer"]
default.ruby_build.prefix = "/usr/local"

default.openssh.server.permit_root_login = 'no'
default.openssh.server.password_authentication = 'no'
default.openssh.server.allow_users = ["deployer"]
default.openssh.server.port = 28820
