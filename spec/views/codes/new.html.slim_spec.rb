require 'rails_helper'

RSpec.describe "codes/new", type: :view do
  before(:each) do
    assign(:code, Code.new(
      title: "MyString",
      author: "MyString",
      permalink: "MyString",
      code: "MyText",
      pepper: "MyString",
      syntax: nil
    ))
  end

  it "renders new code form" do
    render

    assert_select "form[action=?][method=?]", codes_path, "post" do

      assert_select "input[name=?]", "code[title]"

      assert_select "input[name=?]", "code[author]"

      assert_select "input[name=?]", "code[permalink]"

      assert_select "textarea[name=?]", "code[code]"

      assert_select "input[name=?]", "code[pepper]"

      assert_select "input[name=?]", "code[syntax_id]"
    end
  end
end
