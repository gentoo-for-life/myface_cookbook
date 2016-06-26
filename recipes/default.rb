#
# Cookbook Name:: myface
# Recipe:: default
#
# Copyright (c) 2016 Tim Smith

package 'myface'

template '/etc/myface.conf' do
  source 'myface.conf.erb'
  variables({
    port: node['myface']['port']
    })
  notifies :restart, 'service[myface]'
end

service 'myface' do
  action [ :enable, :start ]
end
