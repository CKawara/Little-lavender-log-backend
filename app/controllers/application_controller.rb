class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'

    get '/categories' do
        categories = Category.all
        categories.to_json
    end

    post '/categories' do 
        category = Category.create(
          body: params[:body],
          username: params[:username]
        )
        category.to_json
    end
end
  