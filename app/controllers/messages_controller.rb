class MessagesController < ApplicationController
	def index
	  @groups = current_user.groups
	  @group = Group.find(params[:group_id])
      @message = Message.new
      @users = @group.users
	end

	def create
	  current_user.messages.create(create_params)
	  redirect_to :root
	end

	private
	  def create_params
	  	params.require(:message).permit(:body,:image).merge(group_id: params[:group_id])
	  end
end
