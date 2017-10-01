class GroupsController < ApplicationController

  before_action :group_find, only: [:edit, :update]

  def index
    @groups = current_user.groups
  end

  def new
  	@group = Group.new
  end

  def create
  	@group = Group.new(create_params)
    binding.pry
  	if @group.save
      redirect_to :root, notice: 'グループを作成しました'
  	else
  	   flash.now[:alert] = "グループを作成できませんでした"
  	   render :new
  	end
  end

  def edit
  end

  def update
    if @group.update(create_params)
       redirect_to :root, notice: 'チャットグループが更新されました'
    else
       flash.now[:alert] = "グループを編集できませんでした"
       render :edit
    end
  end

  private
    def create_params
      params.require(:group).permit(:group_name, user_ids: [])
    end

    def group_find
      @group = Group.find(params[:id])
    end

end
