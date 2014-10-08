#
# Cookbook Name:: vps-rails
# Recipe:: default
#
# Copyright 2014, Quark Solutions
#
# All rights reserved - Do Not Redistribute
#

execute "apt-get update" do
  command "apt-get -y update"
end

node.packages.each do |pkg|
  package pkg
end

users_manage "deployer" do
  group_id 2000
  action [ :remove, :create ]
end

include_recipe "sudo"
include_recipe "openssh"
