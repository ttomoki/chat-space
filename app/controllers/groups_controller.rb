class GroupsController < ApplicationController

  def index
  end

  def new
  	@group = Group.new
  end

  def create
  	@group = Group.new(create_params)
  	if @group.save
  	   redirect_to :root, notice: 'グループを作成しました'
  	else
  	   render :new
  	end
  end

  def edit
  	@group = Group.find(10)
  end

  def update
  end

  private
    def create_params
      params.require(:group).permit(:group_name,user_ids: [])
    end

end
