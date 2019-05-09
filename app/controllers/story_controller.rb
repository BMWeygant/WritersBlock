class StoryController < ApplicationController

  get '/stories' do
      if logged_in?
        @stories = Story.all
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
        @story = Story.create(title: params[:title], genre: params[:genre], synopsis: params[:synopsis])
        #binding.pry
        if @story.save
          redirect to "/stories/#{@story.id}"
        else

        end
      end
    end
  end

  get '/stories/:id' do
    if logged_in?
      @story = Story.find_by_id(params[:id])
      erb :'stories/show_story'
    else
      redirect to '/login'
    end
  end

  get '/stories/:id/edit' do
    if logged_in?
      @story = Story.find_by_id(params[:id])
      if @story && @story.user == current_user
        erb :'stories/edit_story'
      else
        redirect to '/stories'
      end
    else
      redirect to '/login'
    end
  end

  patch '/stories/:id' do
    if logged_in?
      if params[:title] == "" || params[:genre] == "" || params[:synopsis] == ""
        redirect to "/stories/#{params[:id]}/edit"
      else
      @story = Story.find_by_id(params[:id])
        if @story && @story.user == current_user
          if @story.update(title: params[:title])
            redirect to "/stories/#{@story.id}"
          else
            redirect to "/stories/#{@story.id}/edit"
          end
        else
          redirect to '/stories'
        end
      end
    else
      redirect to '/login'
    end
  end

  delete '/stories/:id/delete' do
    if logged_in?
      @story = Story.find_by_id(params[:id])
      if @story && @story.user == current_user
        @story.delete
      end
      redirect to '/stories'
    else
      redirect to '/login'
    end
  end

end
