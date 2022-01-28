require 'rails_helper'

RSpec.describe "vehicles/edit", type: :view do
  before(:each) do
    @vehicle = assign(:vehicle, Vehicle.create!(
      manufacturer: "MyString",
      model: "MyString",
      plate_number: "MyString",
      category: "MyString",
      body_style: "MyString",
      color: "MyString",
      year: 1,
      ad_size: "",
      ad_duration: 1,
      user: nil
    ))
  end

  it "renders the edit vehicle form" do
    render

    assert_select "form[action=?][method=?]", vehicle_path(@vehicle), "post" do

      assert_select "input[name=?]", "vehicle[manufacturer]"

      assert_select "input[name=?]", "vehicle[model]"

      assert_select "input[name=?]", "vehicle[plate_number]"

      assert_select "input[name=?]", "vehicle[category]"

      assert_select "input[name=?]", "vehicle[body_style]"

      assert_select "input[name=?]", "vehicle[color]"

      assert_select "input[name=?]", "vehicle[year]"

      assert_select "input[name=?]", "vehicle[ad_size]"

      assert_select "input[name=?]", "vehicle[ad_duration]"

      assert_select "input[name=?]", "vehicle[user_id]"
    end
  end
end
