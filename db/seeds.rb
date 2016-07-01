database = SQLite3::Database.new("db/skill_inventory_development.db")

database.execute("DELETE FROM skills")

database.execute(
                "INSERT INTO skills
          (title, description)
        VALUES
          ('Throwing knives', 'sweet'),
          ('pencil pushing', 'obviously'),
          ('breathing', 'cool'),
          ('nothing', 'I'm skill-less');"

)

puts "It worked and:"
p database.execute("SELECT * FROM skills;")
