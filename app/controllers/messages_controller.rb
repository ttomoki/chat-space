class MessagesController < ApplicationController
	def index
	  set_data
	end

	def create
	  @message = current_user.messages.new(create_params)
	  if @message.save
	     redirect_to :group_messages
	  else
	  	 flash.now[:alert] = @message.errors.full_messages.last
	  	 set_data
	  	 render :index
	  end
	end

	private
	  def create_params
	  	params.require(:message).permit(:body,:image).merge(group_id: params[:group_id])
	  end

      def set_data
		@groups = current_user.groups
		@group = Group.find(params[:group_id])
		@message = Message.new
		@users = @group.users
		@messages = @group.messages
	  end

end
