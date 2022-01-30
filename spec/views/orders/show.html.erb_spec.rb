require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      vehicle: nil,
      phone_number: "Phone Number",
      company_title: "Company Title",
      name: "Name",
      surname: "Surname",
      email_address: "Email Address"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Company Title/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Surname/)
    expect(rendered).to match(/Email Address/)
  end
end
