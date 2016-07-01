ENV["RACK_ENV"] ||= "test"

require File.expand_path('../../config/environment',  __FILE__)

require 'minitest/autorun'
require 'minitest/pride'
gem 'capybara/dsl'
gem 'launchy'



module TestHelper

  def skill_inventory
  database = YAML::Store.new('db/skill_inventory_test')
  @database ||= SkillInventory.new
  end

  def teardown
    skill_inventory.delete_all
    super
  end

end


Cabybara.app = SkillInventoryApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
end
