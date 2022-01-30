require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      vehicle: nil,
      phone_number: "MyString",
      company_title: "MyString",
      name: "MyString",
      surname: "MyString",
      email_address: "MyString"
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input[name=?]", "order[vehicle_id]"

      assert_select "input[name=?]", "order[phone_number]"

      assert_select "input[name=?]", "order[company_title]"

      assert_select "input[name=?]", "order[name]"

      assert_select "input[name=?]", "order[surname]"

      assert_select "input[name=?]", "order[email_address]"
    end
  end
end
