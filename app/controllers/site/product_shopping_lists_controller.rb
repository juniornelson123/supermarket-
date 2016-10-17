class Site::ProductShoppingListsController < SiteController
  before_action :set_product_shopping_list, only: [:show, :edit, :update, :destroy]

  # GET /product_shopping_lists
  # GET /product_shopping_lists.json
  def index
    @product_shopping_lists = ProductShoppingList.where(shopping_list_id: params[:shopping_list_id])
  end

  # GET /product_shopping_lists/1
  # GET /product_shopping_lists/1.json
  def show
  end

  # GET /product_shopping_lists/new
  def new
    @product_shopping_list = ProductShoppingList.new
  end

  # GET /product_shopping_lists/1/edit
  def edit
  end

  # POST /product_shopping_lists
  # POST /product_shopping_lists.json
  def create
    @product_shopping_list = ProductShoppingList.new(product_shopping_list_params)

    respond_to do |format|
      if @product_shopping_list.save
        format.html { redirect_to @product_shopping_list, notice: 'Product shopping list was successfully created.' }
        format.json { render :show, status: :created, location: @product_shopping_list }
      else
        format.html { render :new }
        format.json { render json: @product_shopping_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_shopping_lists/1
  # PATCH/PUT /product_shopping_lists/1.json
  def update
    respond_to do |format|
      if @product_shopping_list.update(product_shopping_list_params)
        format.html { redirect_to @product_shopping_list, notice: 'Product shopping list was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_shopping_list }
      else
        format.html { render :edit }
        format.json { render json: @product_shopping_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_shopping_lists/1
  # DELETE /product_shopping_lists/1.json
  def destroy
    @product_shopping_list.destroy
    respond_to do |format|
      format.html { redirect_to product_shopping_lists_url, notice: 'Product shopping list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_shopping_list
      @product_shopping_list = ProductShoppingList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_shopping_list_params
      params.require(:product_shopping_list).permit!
    end
end
