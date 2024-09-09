class ProductsController <ApplicationController
  before_action :set_category
    # def index
    #     @products = @category.products 
    # end

    def show
      if @category
        @product = @category.products.find(params[:id])
      else
        redirect_to categories_path, alert: "Category not found."
      end
      end
    
      def new
        @product = @category.products.build
        respond_with(@product)
      end
    
      def create
    
        @category  =Category.find(params[:category_id])
        @product = @category.products.build(params[:product])
        flash[:notice] = 'Product was successfully created'. if @product.save
        respond_with(@category, @product, status:201)
        
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