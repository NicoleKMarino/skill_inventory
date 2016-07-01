environments = ["test", "development"]

environments.each do |environment|
  database = SQLite3::Database.new("db/skill_inventory_#{environment}.db")
  database.execute("CREATE TABLE skills (id INTEGER PRIMARY KEY AUTOINCREMENT,title VARCHAR(64),description VARCHAR(64));")
  puts "creating skills table for #{environment}"
end
