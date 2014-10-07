#
# Cookbook Name:: vps-rails
# Recipe:: default
#
# Copyright 2014, Quark Solutions
#
# All rights reserved - Do Not Redistribute
#

node.packages.each do |pkg|
  package pkg
end

users_manage "deployer" do
  group_id 2000
  action [ :remove, :create ]
end
