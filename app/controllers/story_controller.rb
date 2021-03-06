class StoryController < ApplicationController

  get '/stories' do
      if logged_in?
        @stories = Story.all
        #binding.pry
        erb :'stories/stories'
      else
        redirect to '/login'
      end
    end

  get '/stories/new' do
    if logged_in?
      erb :'stories/new'
    else
      redirect to '/login'
    end
  end

  post '/stories/new' do
    if logged_in?
      if params[:title] == "" || params[:genre] == "" || params[:synopsis] == ""
        redirect to '/stories/new'
      else
        @story = current_user.stories.create(title: params[:title], genre: params[:genre], synopsis: params[:synopsis])
        #binding.pry
         #@story.save
        erb :'stories/show_story'
      end
    end
  end

  get '/stories/:id' do
    if logged_in?
      @story = Story.find_by_id(params[:id])
      #binding.pry
      erb :'stories/show_story'
    else
      redirect to '/login'
    end
  end

  get '/stories/:id/edit' do
    @story = Story.find_by_id(params[:id])
      if logged_in? && @story.user_id == current_user.id
        erb :'stories/edit_story'
      else
        erb :'stories/stories'
      end
  end

  patch '/stories/:id' do
    @story = Story.find_by(id: params[:id])
    @story.title = params[:title]
    @story.genre = params[:genre]
    @story.synopsis = params[:synopsis]
    @story.save
    redirect to "/stories/#{@story.id}"
  end

  post '/stories/:id' do
    @story = Story.find_by_id(params[:id])
    @story.title = params[:title]
    @story.genre = params[:genre]
    @story.synopsis = params[:synopsis]
    @story.save
    redirect to "/stories/#{@story.id}"
  end

  delete '/stories/:id'do
    @story = Story.find_by(id: params[:id])
        @story.destroy

      redirect '/stories'
    end

end
