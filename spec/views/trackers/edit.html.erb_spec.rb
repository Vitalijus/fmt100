require 'rails_helper'

RSpec.describe "trackers/edit", type: :view do
  before(:each) do
    @tracker = assign(:tracker, Tracker.create!(
      latitude: 1.5,
      longitude: 1.5,
      altitude: "MyString",
      angle: "MyString",
      satellites: "MyString",
      speed: "MyString"
    ))
  end

  it "renders the edit tracker form" do
    render

    assert_select "form[action=?][method=?]", tracker_path(@tracker), "post" do

      assert_select "input[name=?]", "tracker[latitude]"

      assert_select "input[name=?]", "tracker[longitude]"

      assert_select "input[name=?]", "tracker[altitude]"

      assert_select "input[name=?]", "tracker[angle]"

      assert_select "input[name=?]", "tracker[satellites]"

      assert_select "input[name=?]", "tracker[speed]"
    end
  end
end
