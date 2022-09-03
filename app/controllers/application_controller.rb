class ApplicationController < Sinatra::Base
    set :default_content_type, "application/json"

    gets "/" do
        notes = Note.all.order(:created_at)
        notes.to_json
    end
end