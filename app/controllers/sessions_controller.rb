class SessionsController < ApplicationController
  def create
    client_id = '08e013dc62d6e220892f'
    client_secret = '57ffe9faadff40015f4a78846854ab235a24cf32'
    code = params[:code]
    user_info = UserSearchFacade.user(client_id, client_secret, code)
    user_create(user_info)

    redirect_to dashboard_path
  end

  private
  def user_create(user_info)
    user          = User.find_or_create_by(uid: user_info.id)
    user.username = user_info.login
    user.uid      = user_info.id
    user.token    = user_info.token
    user.save
    session[:user_id] = user.id
  end
end
