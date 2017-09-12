class GroupsController < ApplicationController

  def index
  end

  def new
  	@group = Group.new
  end

  def create
  	Group.create(create_params)
  	redirect_to :root and return
  end

  def edit
  end

  def update
  end

  private
    def create_params
      params.require(:group).permit(:group_name)
    end

end
