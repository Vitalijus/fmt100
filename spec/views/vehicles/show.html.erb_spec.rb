require 'rails_helper'

RSpec.describe "vehicles/show", type: :view do
  before(:each) do
    @vehicle = assign(:vehicle, Vehicle.create!(
      manufacturer: "Manufacturer",
      model: "Model",
      plate_number: "Plate Number",
      category: "Category",
      body_style: "Body Style",
      color: "Color",
      year: 2,
      ad_size: "",
      ad_duration: 3,
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Manufacturer/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/Plate Number/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Body Style/)
    expect(rendered).to match(/Color/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
  end
end
