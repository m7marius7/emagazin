class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index show ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

      if @product.save
        redirect_to product_url(@product), notice: "Product was successfully created."
      else
        format.html { render :new, status: :unprocessable_entity }
      end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
      if @product.update(product_params)
        redirect_to product_url(@product), notice: "Product was successfully updated."
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    redirect_to products_url, notice: "Product was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :price, images: [])
    end
end
