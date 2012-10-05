#
# Cookbook Name:: joyent-vm-on-boot
# Recipe:: default
#
# Copyright 2012, HiganWorks LLC
#
# MIT License
#


%w(var home opt ).each do |w|

  execute "mv dirs and bind mount" do
    command "mv /#{w} /data/ ;mkdir /#{w}; mount --bind /data/#{w} /#{w}"
  end

  mount "/#{w}" do
    device "/data/#{w}"
    fstype "none"
    options "bind"
    action :enable
  end

end


log("Some directories are remount to /data/* .") { level :warn }
log("Prease reboot virtualmachine.")             { level :warn }
