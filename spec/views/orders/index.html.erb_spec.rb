require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        vehicle: nil,
        phone_number: "Phone Number",
        company_title: "Company Title",
        name: "Name",
        surname: "Surname",
        email_address: "Email Address"
      ),
      Order.create!(
        vehicle: nil,
        phone_number: "Phone Number",
        company_title: "Company Title",
        name: "Name",
        surname: "Surname",
        email_address: "Email Address"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Phone Number".to_s, count: 2
    assert_select "tr>td", text: "Company Title".to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Surname".to_s, count: 2
    assert_select "tr>td", text: "Email Address".to_s, count: 2
  end
end
