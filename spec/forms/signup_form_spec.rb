require 'rails_helper'

RSpec.describe SignupForm do
  let(:form) { SignupForm.new(params) }

  describe '#save' do
    before { form.save }

    context 'with valid params' do
      let(:params) {{
        first_name: 'Valid',
        last_name: 'User',
        email: 'validuser@gmail.com',
        password: 'validpassword',
        password_confirmation: 'validpassword'
      }}

      it 'creates a user with a valid token' do
        expect(form.user.persisted?).to eq(true)
        expect(form.token.present?).to eq(true)

        decoded_token = JsonWebToken.decode(form.token)
        expect(decoded_token[:user_id]).to eq(form.user.id)
      end
    end

    context 'with invalid params' do
      let(:params) {{
        first_name: '',
        last_name: '',
        email: 'invalidemailstring',
        password: 'password that doesnt match',
        password_confirmation: 'asdasdasdasd'
      }}

      it "doesn't create a user or token" do
        expect(User.count).to eq(0)
        expect(form.token.present?).to eq(false)
      end
    end

    fcontext 'with an email that has already been taken' do
      let(:user) { create(:user) }

      let(:params) {{
        first_name: 'Copy',
        last_name: 'Cat',
        email: user.email,
        password: 'password',
        password_confirmation: 'password'
      }}

      it "doesn't create another user or token" do
        expect(User.count).to eq(1)
        expect(form.token.present?).to eq(false)
        expect(form.errors[:email].present?).to eq(true)
      end
    end
  end
end
