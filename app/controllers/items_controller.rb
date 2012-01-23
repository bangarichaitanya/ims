class ItemsController < ApplicationController
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @item }
    end
  end

  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save!
        flash[:notice] = 'Item was successfully created.'
        format.html { redirect_to(@item) }
        format.xml { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  def index
    @items = Item.paginate(:per_page => 5, :page => params[:page])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @item }
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.user_id = current_user.id

    respond_to do |format|
      if @item.update_attributes!(params[:item])
        flash[:notice] = 'Item was successfully updated.'
        format.html { redirect_to(@item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

end
