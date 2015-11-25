class Admin::ProductsController < AdminController
  before_action :set_variables, only: [:index, :edit, :create, :update]

  def index
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])

    render :index
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to({ action: :index }, success: "#{@product.name} created")
    else
      render :index, warning: @product.errors.full_messages.join(", ")
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to({ action: :index }, success: "#{@product.name} updated")
    else
      render :index, warning: @product.errors.full_messages.join(", ")
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to({ action: :index }, danger: "#{@product.name} deleted")
  end

  private
  def set_variables
    @products = Product.all
    @groups = Group.all
  end

  def product_params
    params.require(:product).permit(
      :primary_product_id,
      :group_id, :image,
      :active, :rank,
      :name, :price,
      :description
    )
  end
end
