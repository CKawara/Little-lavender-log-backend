class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'

    get '/categories' do
        categories = Category.all
        categories.to_json
    end

    post '/categories' do 
        category = Category.create(
          name: params[:name]
        )
        category.to_json
    end
    post '/users' do 
        user = User.create(
          name: params[:name],
          name: params[:email],
          name: params[:password]
        )
        user.to_json
    end
    get '/users/:id' do
        user = User.find(params[:id])
        user.to_json
    end

    get '/entries' do
        entries = Entry.all
        entries.to_json
    end
    get '/entries/:id' do
        entry = Entry.find(params[:id])
    
        entry.to_json
    end
    post '/entries' do 
        entry = Entry.create(
          title: params[:title],
          body: params[:body],
          user_id: params[:user_id],
          category_id: params[:category_id]
        )
        entry.to_json
    end
    patch '/entries/:id' do 
        entry = Entry.find(params[:id])
        entry.update(
          title: params[:title],
          body: params[:body]
        )
        entry.to_json
    end
    delete '/entries/:id' do 
        entry = Entry.find(params[:id])
        entry.destroy
        entry.to_json
    end
end
  