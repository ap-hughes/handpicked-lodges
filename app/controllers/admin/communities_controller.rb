class Admin::CommunitiesController < Admin::AdminController
  before_action :find_community

  def edit
  end

  def update
    if @community.update(community_params)
      redirect_to admin_properties_path
    else
      render :edit
    end
  end

  private

  def find_community
    @community = Community.find(params[:id])
  end

  def community_params
    params.require(:community).permit(:childrens_forest_trees, :seasgair_trees,
      :eden_reforestation_trees, :donation, :rewilding_sponsorship)
  end
end
