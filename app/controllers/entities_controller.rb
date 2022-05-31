class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @group = Group.find(params[:group_id])
    @entities = @group.entities.order(created_at: :desc)

    redirect_to new_user_session_path, notice: 'You cannot access this resource.' if @group.user != current_user
  end

  def new
    @group = Group.find(params[:group_id])
    @groups = Group.where(user: current_user)
    @entity = Entity.new
  end

  def edit; end

  def create
    @entity = Entity.new(entity_params)
    @entity.user = current_user
    @group = Group.find(params[:group_id])
    @group.entities << @entity

    if @entity.save
      redirect_to group_entities_path(@group), notice: 'Your transaction has been added successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to entities_url, notice: 'Entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entity
    @entity = Entity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entity_params
    params.require(:entity).permit(:name, :amount, :user_id)
  end
end
