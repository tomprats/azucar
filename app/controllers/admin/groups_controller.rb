class Admin::GroupsController < AdminController
  def index
    @group = Group.new
    @groups = Group.all
  end

  def edit
    @group = Group.find(params[:id])
    @groups = Group.all

    render :index
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to({ action: :index }, success: "#{@group.name} created")
    else
      @groups = Group.all
      render :index, warning: @group.errors.full_messages.join(", ")
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to({ action: :index }, success: "#{@group.name} updated")
    else
      @groups = Group.all
      render :index, warning: @group.errors.full_messages.join(", ")
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to({ action: :index }, danger: "#{@group.name} deleted")
  end

  private
  def group_params
    params.require(:group).permit(
      :primary_product_id,
      :active, :rank,
      :name, :description
    )
  end
end
