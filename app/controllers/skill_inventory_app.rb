require "models/skill_inventory"

class SkillInventoryApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')

  get '/skills' do
    @skills  = skill_inventory.all
    erb :index
  end

  get '/' do
    erb :main
  end


  get '/skills/new' do
    erb :new
  end

  post '/skills' do
    skill_inventory.create(params[:skill])
    redirect "/skills"
  end

  get '/skills/:id' do |id|
    @skills = skill_inventory.find(id.to_i)
    erb :show
  end

  get '/skills/:id/edit' do |id|
  @task = skill_inventory.find(id.to_i)
  erb :edit
  end

  get '/skills/clear' do
  skill_inventory.delete_all
  redirect "/"
  end

  def skill_inventory
    @skill_inventory ||= SkillInventory.new
  end


end
