require 'rails_helper'

RSpec.describe "vehicles/index", type: :view do
  before(:each) do
    assign(:vehicles, [
      Vehicle.create!(
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
      ),
      Vehicle.create!(
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
      )
    ])
  end

  it "renders a list of vehicles" do
    render
    assert_select "tr>td", text: "Manufacturer".to_s, count: 2
    assert_select "tr>td", text: "Model".to_s, count: 2
    assert_select "tr>td", text: "Plate Number".to_s, count: 2
    assert_select "tr>td", text: "Category".to_s, count: 2
    assert_select "tr>td", text: "Body Style".to_s, count: 2
    assert_select "tr>td", text: "Color".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
