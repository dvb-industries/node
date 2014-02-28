package "git"
package "make"
package "g++"

git "/opt/nodejs" do
  repository "git://github.com/joyent/node.git"
  revision "v0.10.25"
  action :sync
end

execute "configure nodejs" do
  cwd "/opt/nodejs"
  command "./configure"
  creates "/opt/nodejs/config.mk"
end

execute "make nodejs" do
  cwd "/opt/nodejs"
  command "make"
  creates "/opt/nodejs/out"
end

execute "make install nodejs" do
  cwd "/opt/nodejs"
  command "make install"
  creates "/usr/local/bin/node"
end
