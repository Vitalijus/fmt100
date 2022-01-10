require 'rails_helper'

RSpec.describe "trackers/show", type: :view do
  before(:each) do
    @tracker = assign(:tracker, Tracker.create!(
      latitude: 2.5,
      longitude: 3.5,
      altitude: "Altitude",
      angle: "Angle",
      satellites: "Satellites",
      speed: "Speed"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/Altitude/)
    expect(rendered).to match(/Angle/)
    expect(rendered).to match(/Satellites/)
    expect(rendered).to match(/Speed/)
  end
end
