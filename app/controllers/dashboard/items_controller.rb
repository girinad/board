class Dashboard::ItemsController < Dashboard::ApplicationController
  def index
    @items = current_user.items.all
  end

  def show
    @item = current_user.items.find(params[:id])
    @photos = @item.photos
  end

  def new
    @item = Item.new
    @item.photos.build
  end

  def edit
    @item = current_user.items.find(params[:id])
    @item.photos.build
  end

  def create
    @item = current_user.items.build(params[:item])
    @item.photos.build
    
    if @item.save
      @item.set_tags(params[:tags])
      redirect_to dashboard_item_path(@item), notice: t('item.notice.saved')
    else
      render action: "new"
    end
  end

  def update
    @item = current_user.items.find(params[:id])

    if @item.update_attributes(params[:item])
      @item.set_tags(params[:tags])
      redirect_to dashboard_item_path(@item), notice: t('item.notice.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy

    redirect_to dashboard_items_url, notice: t('item.notice.deleted')
  end
end
