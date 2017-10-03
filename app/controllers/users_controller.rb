class UsersController < ApplicationController
	def edit
	end

	def update
	  if
      current_user.update(update_params)
      redirect_to :root
    else
    	render:edit
    end
  end

  def search
    keyword = params[:keyword]
    if keyword != ""
      @users = User.where('name LIKE(?)', "%#{keyword}%")
      respond_to do |format|
       format.json
      end
    end
  end

  private
    def update_params
      params.require(:user).permit(:name, :email)
    end
end
