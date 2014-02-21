class ProductsController < ApplicationController
  def index

    @product_name='new'
    @product_details=$redis.lrange("#{@product_name}",0,-1)


    #@product_one=$redis.get("product_name")
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @item = Product.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end


  def create
  end

  def show
  end

  def destroy
  end

  def update
  end

  
end
