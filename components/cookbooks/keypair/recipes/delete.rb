# Cookbook Name:: keypair
# Recipe:: delete
#
# Copyright 2016, Walmart Stores, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

kp = {}
kp[:private] = "keygen"
kp[:public] = "keygen"
node.set["keypair"] = kp

include_recipe "keypair::setup"

case node[:provider_class]
when /vagrant/
  Chef::Log.info("keypair delete not implemented for provider")
when /azure/
    include_recipe "azurekeypair::delete"
else
  include_recipe "keypair::del_keypair_"+node[:provider_class]
end
