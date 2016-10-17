class Site::ShoppingListsController < SiteController
  before_action :set_shopping_list, only: [:edit, :update, :destroy]
  before_action :set_session_shopping_list, only: [:create]
  
  # GET /shopping_lists
  # GET /shopping_lists.json
  def index
    @shopping_lists = ShoppingList.where(user_id: current_user.id)
  end

  def continue
    
    @shopping_list = ShoppingList.find(params[:id])
    session[:shopping_list_id] = @shopping_list.id

    redirect_to site_establishment_products_path
  end
  # GET /shopping_lists/1
  # GET /shopping_lists/1.json
  def show
    @shopping_list = ProductShoppingList.where(shopping_list_id: params[:id])
  end

  # GET /shopping_lists/new
  def new
    @shopping_list = ShoppingList.new
  end

  # GET /shopping_lists/1/edit
  def edit
  end


  # POST /shopping_lists
  # POST /shopping_lists.json
  def create
    
    if @shopping_list_item = ProductShoppingList.create(product_id: params[:product_id], shopping_list_id: session[:shopping_list_id])
      redirect_to "/site/establishments/#{ params[:establishment_id] }/shopping_lists/#{ session[:shopping_list_id] }/product_shopping_lists", notice: 'Shopping list was successfully created.'
    else
      render :new
    end

    
  end

  # PATCH/PUT /shopping_lists/1
  # PATCH/PUT /shopping_lists/1.json
  def update
    respond_to do |format|
      if @shopping_list.update(shopping_list_params)
        format.html { redirect_to [:site,@shopping_list], notice: 'Shopping list was successfully updated.' }
        format.json { render :show, status: :ok, location: @shopping_list }
      else
        format.html { render :edit }
        format.json { render json: @shopping_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_lists/1
  # DELETE /shopping_lists/1.json
  def destroy
    @shopping_list.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Shopping list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

    def set_session_shopping_list
          
      @shopping_list = ShoppingList.find(session[:shopping_list_id])
            
      rescue 
        @shopping_list = ShoppingList.create(establishment_id: params[:establishment_id],user_id: current_user.id)
        session[:shopping_list_id]=@shopping_list.id 
        @shopping_list = ShoppingList.find(session[:shopping_list_id])
        @shopping_list.name="Lista #{ @shopping_list.id } do #{ @shopping_list.establishment.name }"
        @shopping_list.save
        

    end

    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_list
      @shopping_list = ShoppingList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopping_list_params
      params.require(:shopping_list).permit!
    end
end
