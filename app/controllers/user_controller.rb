class UserController < ApplicationController
  before_action :authenticate_user!

  def show
  	
  end

  def index
  	@users  = User.all
  	@users = @users - [current_user]
    @all_friends = current_user.friends.all
  end

end
