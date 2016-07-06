
require_relative 'test_helper'

class SkillTest <Minitest::Test

  def test_gives_attributes_correctly
  	@skill = Skill.new("title" => "New Skill", "description" => "Skill Description")
    assert_equal "New Skill", @skill.title
    assert_equal "Skill Description", @skill.description
  end
end
