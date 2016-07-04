class Skill
  attr_reader :title,
              :description,
              :image,
              :id

  def initialize(data)
    @id          = data["id"]
    @title       = data["title"]
    @description = data["description"]
    @image = data["image"]
  end

end
