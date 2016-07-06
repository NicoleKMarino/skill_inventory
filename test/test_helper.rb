ENV["RACK_ENV"] ||= "test"

require File.expand_path('../../config/environment',  __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
gem 'launchy'
require 'sqlite3'

module TestHelper

  def skill_inventory
  @database ||= SkillInventory.new
  end

  def teardown
    skill_inventory.delete_all
    super
  end
end
