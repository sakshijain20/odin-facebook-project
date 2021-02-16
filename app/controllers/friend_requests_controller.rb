class FriendRequestsController < ApplicationController

	before_action :authenticate_user!

	def create
    request = current_user.sent_friend_requests.build(requestee_id: params[:user_id])


    if request.save!
      flash.notice = 'Friend Request sent'
    else
      flash.notice = 'Oops! Trouble sending request.'
    end

  end  

  def destroy
    friend_request = FriendRequest.find_by(id: params[:id])
    friend_request.decline
    redirect_to request.referrer
  end

end
