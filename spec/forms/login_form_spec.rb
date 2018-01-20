require "rails_helper"

RSpec.describe LoginForm do
  describe "#save" do
    let(:form) { LoginForm.new(params) }
    let(:user) { create(:user, email: "email@gmail.com", password: "password") }
    before { form.save }

    context "with valid params" do
      let(:params) {{
        email: user.email,
        password: user.password
      }}

      it "finds the user in and gives a valid token" do
        expect(form.user).to eq(user)
        expect(form.token.present?).to eq(true)

        decoded_token = JsonWebToken.decode(form.token)
        expect(decoded_token[:user_id]).to eq(form.user.id)
      end
    end

    context "with invalid params" do
      let(:params) {{
        email: user.email,
        password: "not the password"
      }}

      it "records an error and doesn't give a token" do
        expect(form.token.present?).to eq(false)
        expect(form.errors[:base].present?).to eq(true)
      end
    end
  end
end
