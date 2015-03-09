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

users_manage "#{node[:vps_rails][:deploy_user]}" do
  group_id 2000
  action [ :remove, :create ]
end

include_recipe "git"
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

rbenv_ruby "#{node[:vps_rails][:ruby_version]}" do
  global true
end

git "/home/#{node[:vps_rails][:deploy_user]}/boem" do
  repository "https://github.com/bosko/boem.git"
  revision "master"
  action :sync
  user "deployer"
  group "deployer"
end

link "/home/#{node[:vps_rails][:deploy_user]}/.emacs.d" do
  to "/home/#{node[:vps_rails][:deploy_user]}/boem"
  owner "deployer"
  group "deployer"
end

file "/home/#{node[:vps_rails][:deploy_user]}/.gemrc" do
  content "gem: --no-ri --no-rdoc"
  owner "#{node[:vps_rails][:deploy_user]}"
  group "#{node[:vps_rails][:deploy_user]}"
  mode '0664'
end

file "/home/#{node[:vps_rails][:deploy_user]}/.tmux.conf" do
  content "unbind C-b
set-option -g prefix `
bind-key ` send-prefix"
  owner "#{node[:vps_rails][:deploy_user]}"
  group "#{node[:vps_rails][:deploy_user]}"
  mode '0664'
end

rbenv_gem "bundler" do
  ruby_version "#{node[:vps_rails][:ruby_version]}"
end

include_recipe "sudo"
include_recipe "openssh"
