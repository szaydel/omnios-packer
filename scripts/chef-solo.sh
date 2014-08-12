# install chef from omniti-ms repository, and symlink for easier use
echo "Installing Chef Solo from OmniTI MS Repository"
pkg install -g http://pkg.omniti.com/omniti-ms/ omniti/system/management/chef
ln -s /opt/omni/lib/ruby/gems/1.9/bin/chef-solo /opt/omni/bin/chef-solo

echo "chef-solo.sh done"
