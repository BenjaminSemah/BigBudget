class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[show edit update destroy]

  def index
    @groups = Group.where(user: current_user)
  end

  def new
    @group = Group.new
  end

  def edit; end

  def create
    @group = Group.new(group_params)
    @group.user = current_user

    if @group.save
      redirect_to groups_path, notice: 'Your new category has been created successfully!'
    else
      redirect_to new_group_path, notice: 'An error occured. Please try again.'
    end
  end

  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
