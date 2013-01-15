class Dashboard::ItemsController < Dashboard::ApplicationController
  def index
    @items = current_user.items.all

    respond_to do |format|
      format.html
    end
  end

  def show
    @item = current_user.items.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @item = Item.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @item = current_user.items.find(params[:id])
  end

  def create
    @item = current_user.items.build(params[:item])

    respond_to do |format|
      if @item.save
        @item.set_tags(params[:tags])
        format.html { redirect_to dashboard_item_path(@item), notice: 'Item was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @item = current_user.items.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        @item.set_tags(params[:tags])
        format.html { redirect_to dashboard_item_path(@item), notice: 'Item was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to dashboard_items_url}
    end
  end
end
