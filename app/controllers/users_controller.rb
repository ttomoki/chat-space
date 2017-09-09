class UsersController < ApplicationController
	def edit
	end

	def update
	  if
        current_user.update(update_params)
        redirect_to :root
      else
      	binding.pry
    	redirect_to 'edit_user_path(current_user)'
      end
    end

    private
      def update_params
        params.require(:user).permit(:name, :email)
      end
end
