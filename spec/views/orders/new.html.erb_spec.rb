require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      vehicle: nil,
      phone_number: "MyString",
      company_title: "MyString",
      name: "MyString",
      surname: "MyString",
      email_address: "MyString"
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "order[vehicle_id]"

      assert_select "input[name=?]", "order[phone_number]"

      assert_select "input[name=?]", "order[company_title]"

      assert_select "input[name=?]", "order[name]"

      assert_select "input[name=?]", "order[surname]"

      assert_select "input[name=?]", "order[email_address]"
    end
  end
end
