require "models/skill_inventory"
require 'sqlite3'

class SkillInventoryApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')

  get '/skills' do
    @skills  = skill_inventory.all
    erb :index
  end

  get '/' do
    erb :main
  end

  post '/skills' do
    skill_inventory.create(params[:skill])
    redirect "/skills"
  end

    get '/skills/new' do
      erb :new
    end

  get '/skills/:id' do |id|
    @skills = skill_inventory.find(id.to_i)
    erb :show
  end


  get '/skills/:id/edit' do |id|
  @skills = skill_inventory.find(id.to_i)
  erb :edit
  end


  post '/skills/:id' do |id|
  skill_inventory.update(id.to_i, params[:skill])
  redirect "/skills/#{id}"
end

  get '/skills/:id/delete' do |id|
  skill_inventory.destroy(id.to_i, params[:skill])
  redirect "/skills"
  end


  get '/clear' do
  skill_inventory.delete_all
  redirect "/skills"
  end

  def skill_inventory
    @skill_inventory ||= SkillInventory.new
  end


end
