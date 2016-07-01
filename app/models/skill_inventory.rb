require_relative 'skill'

class SkillInventory
  attr_reader :database
  def initialize
    database_creator
  end


def database_creator
  if ENV['RACK_ENV'] == "test"
      @database = SQLite3::Database.new("db/skill_inventory_test.db")
      database.execute("CREATE TABLE skills (id INTEGER PRIMARY KEY AUTO_INCREMENT,title VARCHAR(64),description VARCHAR(64));") unless @database != nil
    else
      @database = SQLite3::Database.new("db/skill_inventory_development.db")
      database.execute("CREATE TABLE skills (id INTEGER PRIMARY KEY,title VARCHAR(64),description VARCHAR(64));") unless @database != nil
    end
  @database.results_as_hash = true
end

    def create(skill)
      @database.execute("INSERT INTO skills (title, description) VALUES (?, ?);", skill[:title], skill[:description])
    end

    def raw_skills
      @database.execute("SELECT * FROM skills;")
    end

    def all
      raw_skills.map { |data| Skill.new(data) }
    end

    def raw_skill(id)
      @database.execute("SELECT * FROM skills WHERE id = ?", id).first
    end

    def find(id)
      Skill.new(raw_skill(id))
    end

    def update(id, skill)
      @database.execute("UPDATE skills SET title= ?, description= ? WHERE id = ?;", skill[:title], skill[:description], id)
    end

    def destroy(id)
      @database.execute("DELETE FROM skills WHERE id = ?;", id)
    end

    def delete_all
      @database.execute("DELETE FROM skills;")
      @database.execute("delete from sqlite_sequence where name='skills';")
    end
  end
