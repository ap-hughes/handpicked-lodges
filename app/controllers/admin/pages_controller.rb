class Admin::PagesController < Admin::AdminController
  def index
    @pages = Page.all
  end

  def edit
    page
  end

  def update
    if page.update(page_params)
      redirect_to admin_pages_path
    else
      render :edit
    end
  end

  private

  def page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:meta_title, :meta_description)
  end
end
