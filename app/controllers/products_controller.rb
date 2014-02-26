class ProductsController < ApplicationController

  def index
   @product_name = [] 
   @product_name = $redis.keys('*')
   @product_details=$redis.lrange("#{@product_name}",0,-1)
   respond_to do |format|
      format.html # index.html.erb
    end
  end


  def new
    `echo  in new:#{@product_name} > /dev/pts/5`
    respond_to do |format|
      format.html # new.html.erb
    end
  end


  def create
    @product_name = params[:name]
    $redis.lpush("#{@product_name}", "#{params[:price]}")
    $redis.lpush("#{@product_name}", "#{params[:author]}")
    $redis.lpush("#{@product_name}", "#{params[:marketer]}")

    @product_details=$redis.lrange("#{@product_name}",0,-1)
    render :action => 'show'
  end

  def show
    # `echo  in show:#{@product_name} > /dev/pts/5`
    @product_details=$redis.lrange("#{params[:id]}",0,-1)
  end

  def destroy
    `echo  in show:#{params[:id]} > /dev/pts/3`
    $redis.del("#{params[:id]}")
  end

  def update
    @product_name = params[:id]
    $redis.del("#{@product_name}")
    $redis.lpush("#{@product_name}", "#{params[:price]}")
    $redis.lpush("#{@product_name}", "#{params[:author]}")
    $redis.lpush("#{@product_name}", "#{params[:marketer]}")

    @product_details=$redis.lrange("#{@product_name}",0,-1)
    render :action => 'show'
  end

  def edit
  end
  
end
