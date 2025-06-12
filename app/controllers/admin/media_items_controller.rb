class Admin::MediaItemsController < Admin::BaseController
  before_action :set_media_item, only: [:show, :edit, :update, :destroy]

  # GET /admin/media_items
  def index
    @media_items = MediaItem.all.order(created_at: :desc)
  end

  # GET /admin/media_items/1
  def show
  end

  # GET /admin/media_items/new
  def new
    @media_item = MediaItem.new
  end

  # GET /admin/media_items/1/edit
  def edit
  end

  # POST /admin/media_items
  def create
    @media_item = MediaItem.new(media_item_params)

    if @media_item.save
      redirect_to admin_media_items_path, notice: 'Media item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/media_items/1
  def update
    if @media_item.update(media_item_params)
      redirect_to admin_media_items_path, notice: 'Media item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /admin/media_items/1
  def destroy
    @media_item.destroy
    redirect_to admin_media_items_path, notice: 'Media item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_media_item
      @media_item = MediaItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def media_item_params
      params.require(:media_item).permit(:title, :description, :category, :file)
    end
end 