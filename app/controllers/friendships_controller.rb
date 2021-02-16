class FriendshipsController < ApplicationController
	before_action :authenticate_user!

	def create
	    friend_request = FriendRequest.find_by(id: params[:friend_request])
	    friend_request.accept
	    redirect_to request.referree
	 end

	 def destroy
	 end

end
