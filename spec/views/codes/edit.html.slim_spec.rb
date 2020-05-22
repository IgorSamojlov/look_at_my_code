require 'rails_helper'

RSpec.describe "codes/edit", type: :view do
  before(:each) do
    @code = assign(:code, Code.create!(
      title: "MyString",
      author: "MyString",
      permalink: "MyString",
      code: "MyText",
      pepper: "MyString",
      syntax: nil
    ))
  end

  it "renders the edit code form" do
    render

    assert_select "form[action=?][method=?]", code_path(@code), "post" do

      assert_select "input[name=?]", "code[title]"

      assert_select "input[name=?]", "code[author]"

      assert_select "input[name=?]", "code[permalink]"

      assert_select "textarea[name=?]", "code[code]"

      assert_select "input[name=?]", "code[pepper]"

      assert_select "input[name=?]", "code[syntax_id]"
    end
  end
end
