class ProductsController <ApplicationController
  before_action :set_category
    # def index
    #     @products = @category.products 
    # end

    def show
      @category = Category.find(params[:category_id])
     @product = @category.products.find(params[:id])
      # if @category
      #   @product = @category.products.find(params[:id])
      # else
      #   redirect_to categories_path, alert: "Category not found."
      # end
      end
    
      def new
        @product = @category.products.build
        respond_with(@product)
      end
    
      def create
    
        @category  =Category.find(params[:category_id])
        @product = @category.products.create(product_params)
        redirect_to category_path(@category)
        
      end

      def destroy
        @category = Category.find(params[:category_id])
        @product = @Category.products.find(params[:id])
        @product.destroy
        redirect_to category_path(@category), status: :see_other
      end

    
    
      private
    
      def set_category
        @category = Category.find(params[:category_id])
      rescue ActiveRecord::RecordNotFound
        flash[:alert] = 'Category not found.'
        
        
      end
    
      def product_params
        params.require(:product).permit(:name) 
      end
end