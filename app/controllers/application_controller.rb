class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'

    get '/' do
        categories = Category.all
        categories.to_json
    end

end
  