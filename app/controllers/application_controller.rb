class ApplicationController < Sinatra::Base
    set :default_content_type, "application/json"

    get "/notes" do
        notes = Note.all.order(:created_at)
        notes.to_json
    end

    post "/notes" do
        note = Note.create(
            title:params[:title],
            content:params[:content]
        )
        note.to_json
    end

    delete "/notes/:id" do 
        note = Note.find(params[:id])
        note.destroy
        note.to_json
    end
end