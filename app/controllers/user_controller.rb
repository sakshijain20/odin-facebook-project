class UserController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def index
  	@users  = User.all
  end

end
