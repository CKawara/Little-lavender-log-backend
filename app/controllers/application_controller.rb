class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'
    enable :sessions


    post "/login" do
        user = User.find_by_username(params[:username])
            if user && user.authenticate(params[:password])
            
                session[:user_id] = user.id
                

                halt 200, {user: user, message:"User successfully logged in"}.to_json
            else
                halt 404, {error: "Invalid information"}.to_json
            end
        end

        delete "/logout" do
            session.delete("user_id")
        end
    end
    
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
          email: params[:email],
          password: params[:password]
        )
        user.to_json
    end
    get '/users/:id' do
        user = User.find(params[:id])
        user.to_json(include: :entries)
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
        entry.to_json(include: :category.name)
    end
end
  