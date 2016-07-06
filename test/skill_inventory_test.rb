require_relative 'test_helper'

class SkillInventoryTest < Minitest::Test
  include TestHelper

  def current_skill_id
    skill_inventory.all.first.id
  end

  def test_it_creates_a_skill
    skill_inventory.create({title: "Bear Fighting ", description: "Bears aint shit"})

    skill = skill_inventory.find(current_skill_id)
    assert_equal "Bear Fighting ", skill.title
    assert_equal "Bears aint shit", skill.description
    assert_equal current_skill_id, skill.id
  end

  def  test_it_can_find_all_skills
    skill_inventory.create({title: "Bear Fighting ", description: "Bears aint shit"})
    skill_inventory.create({title: "Bear Fighting 1", description: "Bears aint shit1"})

    skills = skill_inventory.all

    assert_equal 2, skills.size
    assert_equal "Bear Fighting ", skills.first.title
    assert_equal "Bears aint shit", skills.first.description
  end

  def test_it_can_find_a_single_skill
    skill_inventory.create({title: "Bear Fighting ", description: "Bears aint shit"})

    skill = skill_inventory.find(current_skill_id)

    assert_equal "Bear Fighting ", skill.title
    assert_equal "Bears aint shit", skill.description
  end

  def test_it_can_update_a_skill
    skill_inventory.create({title: "Bear Fighting ", description: "Bears aint shit"})
    skill_inventory.update(current_skill_id, {title: "title", description: " Description"})
    skill = skill_inventory.find(current_skill_id)
    assert_equal "title", skill.title
  end

  def test_it_can_destroy_a_skill
    skill_inventory.create({title: "Bear Fighting ", description: "Bears aint shit"})

    assert_equal 1, skill_inventory.all.size

    skill_inventory.destroy(current_skill_id)

    assert_equal 0, skill_inventory.all.size
  end
end
