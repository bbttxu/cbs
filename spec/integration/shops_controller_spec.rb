require 'spec_helper'

describe ShopsController, :type => :controller do

  describe "GET current shops" do
    it "assigns @shops" do
      shops = FactoryGirl.create(:shop)

      get 'shops/current'
      # FIXME
      # expect(assigns(:shops).all).to eq([shops.to_json])
    end

    it "renders the index template" do
      get 'shops/current'
      expect(response).to render_template("current")
    end
  end
end
