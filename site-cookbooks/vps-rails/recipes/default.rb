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

file "/home/deployer/.gemrc" do
  content "gem: --no-ri --no-rdoc"
  owner 'deployer'
  group 'deployer'
  mode '0664'
end

include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

rbenv_ruby "2.1.2" do
  global true
end

rbenv_gem "bundler" do
  ruby_version "2.1.2"
end

include_recipe "sudo"
include_recipe "openssh"
