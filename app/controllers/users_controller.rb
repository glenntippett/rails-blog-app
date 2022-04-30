class UsersController < ApplicationController
  def dashboard
    @posts = current_user.posts
  end
end
