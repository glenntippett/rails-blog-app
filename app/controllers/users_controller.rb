class UsersController < ApplicationController
  def show
    # TODO: replace with current user when signed in
    @user = User.find_by_email('test@test.com')
  end
end
