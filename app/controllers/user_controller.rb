class UserController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/signup'
    else
      redirect '/stories'
    end
  end

  post '/signup' do
    user = User.all.find{|user| user.username == params[:username]}
    user ||= User.all.find{|user| user.email == params[:email]}
    if user
      @error_message =  "That username or email already exists. Please try again."
      erb :'users/signup'
    elsif params[:password] != params[:password1]
      @error_message = "Passwords do not match. Please .try again."
      erb :'users/signup'
    else
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      redirect '/stories'
  end
end

get '/login' do
  if logged_in?
    redirect '/stories'
  else
  erb :'users/login'
  end
end

post '/login' do
  @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user[:id]
      redirect '/stories'
    else
      @error_message = "The username and/or password you entered is incorrect. Please try again."
      erb :'users/login'
  end
end


  get '/logout' do
    session.clear
    redirect :'/login'
  end


end
