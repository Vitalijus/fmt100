require 'rails_helper'

RSpec.describe "trackers/index", type: :view do
  before(:each) do
    assign(:trackers, [
      Tracker.create!(
        latitude: 2.5,
        longitude: 3.5,
        altitude: "Altitude",
        angle: "Angle",
        satellites: "Satellites",
        speed: "Speed"
      ),
      Tracker.create!(
        latitude: 2.5,
        longitude: 3.5,
        altitude: "Altitude",
        angle: "Angle",
        satellites: "Satellites",
        speed: "Speed"
      )
    ])
  end

  it "renders a list of trackers" do
    render
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: 3.5.to_s, count: 2
    assert_select "tr>td", text: "Altitude".to_s, count: 2
    assert_select "tr>td", text: "Angle".to_s, count: 2
    assert_select "tr>td", text: "Satellites".to_s, count: 2
    assert_select "tr>td", text: "Speed".to_s, count: 2
  end
end
