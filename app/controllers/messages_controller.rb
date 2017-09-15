class MessagesController < ApplicationController
	def index
	  @groups = current_user.groups
	  @group = Group.find(params[:group_id])
      @message = Message.new
      @users = @group.users
      @messages = @group.messages
	end

	def create
	  @message = current_user.messages.new(create_params)
	  if @message.save
	     redirect_to :group_messages
	  else
	  	 redirect_to :group_messages, alert: 'メッセージを入力してください'
	  end
	end

	private
	  def create_params
	  	params.require(:message).permit(:body,:image).merge(group_id: params[:group_id])
	  end
end
