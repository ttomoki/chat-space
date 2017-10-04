class MessagesController < ApplicationController
	def index
	  set_data
	  respond_to do |format|
        format.html
        format.json { @new_message = Message.where('id > ?', params[:messageId]) }
      end
	end

	def create
	  @message = current_user.messages.new(create_params)
	  if @message.save
	  	respond_to do |format|
          format.html { redirect_to group_messages_path }
          format.json { flash.now[:notice] = "メッセージを送信しました" }
        end
	  else
	  	respond_to do |format|
	  	  format.html{ redirect_to group_messages_path, alert: @message.errors.full_messages.last }
        end
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
