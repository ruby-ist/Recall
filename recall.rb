require 'sinatra'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'

require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-migrations'

configure :development do
  DataMapper.setup(:default,"sqlite3://#{Dir.pwd}/recall.db")
end

configure :production do
  DataMapper.setup(:default, ENV["DATABASE_URL"])
end

class Note
  include DataMapper::Resource

  property :id, Serial
  property :content, Text, :required => true, :lazy => false
  property :complete, Boolean
  property :created_at, DateTime
  property :updated_at, DateTime

end

DataMapper.finalize.auto_upgrade!

enable :sessions

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

get "/" do
  @notes = Note.all :order => :id.desc
  @title = "All Notes"
  if @notes.empty?
    flash[:error] = "No notes as of now to display!"
  end
  erb :home
end

post "/" do
  n =  Note.new
  n.content = params[:content]
  n.complete = false
  n.created_at = Time.now
  n.updated_at = Time.now
  if n.save
    redirect "/", :notice=>"Note created successfully!"
  else
    redirect "/", :error=>"Error creating the note! please try again."
  end
end

get "/:id" do
  @note = Note.get params[:id]
  @title = "Edit Note ##{@note.id}"
  if @note
    erb :edit
  else
    redirect "/", :error=>"There is no such note yet!"
  end
end

put "/:id" do
  n = Note.get params[:id]
  n.content = params[:content]
  n.complete = params[:complete] ? true : false
  n.updated_at = Time.now
  if n.save
    redirect "/", :notice=>"Note ##{n.id} edited successfully!"
  else
    redirect "/", :error=>"Error editing the note ##{n.id}!"
  end
end

get "/:id/delete" do
  @note = Note.get params[:id]
  @title = "Confirm Delete"
  if @note
    erb :delete
  else
    redirect "/", :error=>"There is no such note yet!"
  end
end

delete "/:id" do
  n = Note.get params[:id]
  if n.destroy
    redirect "/", :notice=>"Note ##{params[:id]} deleted successfully!"
  else
    redirect "/", :error=>"Error deleting the note ##{params[:id]}!"
  end
end

get "/:id/complete" do
  n = Note.get params[:id]
  n.complete = n.complete ? false : true
  n.updated_at = Time.now
  n.save
  redirect "/"
end
