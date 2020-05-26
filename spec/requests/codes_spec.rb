# frozen_string_literal: true

RSpec.describe "/codes", type: :request do

  let(:valid_attributes) do
    {
      code: 'Hello world!',
      title: 'title',
      expires: '1day',
      syntax_id: create(:syntax).to_param,
    }
  end

  let(:invalid_attributes) do
    {
      code: '',
      title: 'title',
      expires: '1day',
    }
  end

  describe "GET /show" do
    it "renders a successful response" do
      code = create :code

      get code_url(code)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_code_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Code" do
        expect {
          post codes_url, params: { code: valid_attributes }
        }.to change(Code, :count).by(1)
      end

      it "redirects to the created code" do
        post codes_url, params: { code: valid_attributes }

        expect(response).to redirect_to(code_url(Code.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Code" do
        expect {
          post codes_url, params: { code: invalid_attributes }
        }.to change(Code, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post codes_url, params: { code: invalid_attributes }

        expect(response).to be_successful
      end

      it 'raise error when expired_at is expired' do
        code = create :code, expired_at: DateTime.now - 1.day

        expect{ get code_url(code) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
