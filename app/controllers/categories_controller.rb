class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  respond_to :html, :xml, :json

  def index
    @category = Category.all
    respond_with(@category)
  end

  def show
    respond_with(@category)
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def edit
    respond_with(@category)
  end

  def create
    @category = Category.new(category_params)
    flash[:notice] = "Category was successfully created" if @category.save
    respond_with(@category)

  end

  def update
    flash[:notice] = 'Category was successfully updated.' if @category.update(category_params)
    respond_with(@category)
  end

  def destroy
    @category.destroy
    flash[:notice] = 'Category was successfully deleted.'
    respond_with(@category)
  end

  private
  
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:title, :description)
    end
end
