require 'rails_helper'

RSpec.describe "trackers/new", type: :view do
  before(:each) do
    assign(:tracker, Tracker.new(
      latitude: 1.5,
      longitude: 1.5,
      altitude: "MyString",
      angle: "MyString",
      satellites: "MyString",
      speed: "MyString"
    ))
  end

  it "renders new tracker form" do
    render

    assert_select "form[action=?][method=?]", trackers_path, "post" do

      assert_select "input[name=?]", "tracker[latitude]"

      assert_select "input[name=?]", "tracker[longitude]"

      assert_select "input[name=?]", "tracker[altitude]"

      assert_select "input[name=?]", "tracker[angle]"

      assert_select "input[name=?]", "tracker[satellites]"

      assert_select "input[name=?]", "tracker[speed]"
    end
  end
end
