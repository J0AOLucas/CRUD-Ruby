class ProductsController < ApplicationController
  require "CSV"
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  def import
    file = params[:file]
    return redirect_to products_path, notice: "Apenas arquivos CSV" unless params[:file].content_type == "text/csv" or params[:file].content_type == "text/tab-separated-values"
    csv_data = File.read(file, encoding: "ISO-8859-1")
    csv = CSV.parse(csv_data, headers: true, col_sep: ';')
    csv.each do |row|
      product_hash = Hash.new
      product_hash[:purchaser_name] = row["purchaser_name"].to_s
      product_hash[:item_description] = row["item_description"].to_s
      product_hash[:item_price] = row[" item_price "].to_f
      product_hash[:purchaser_name] = row["purchaser_name"].to_s
      product_hash[:purchase_count] = row["purchase_count"].to_i
      product_hash[:merchant_address] = row["merchant_address"].to_s
      product_hash[:merchant_name] = row["merchant_name"].to_s
      #binding.b
      Product.create(product_hash)
      #p row
    end
    
    redirect_to products_path, notice: "Arquivo importado!"
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

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:purchaser_name, :item_description, :item_price, :purchase_count, :merchant_address, :merchant_name)
    end
end
