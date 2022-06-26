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
end
  