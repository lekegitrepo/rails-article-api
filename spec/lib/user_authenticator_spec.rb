require 'rails_helper'

RSpec.describe UserAuthenticator do
  describe "#perform" do
    let(:authenticator) { described_class.new('sample_code') }

    subject { authenticator.perform } 

    context "when the code is incorrect" do
      let(:error) { double("Sawyer::Resource", error: "bad_verification_code") }

      before do
        allow_any_instance_of(Octokit::Client).to receive(
          :exchange_code_for_token).and_return(error)
      end

      it "should raise an error" do
        expect { subject }.to raise_error(
          UserAuthenticator::AuthenticationError
        )
        expect(authenticator.user).to be_nil
      end
    end

    context "when the code is valid/correct" do
      let(:user_data) do
        {
          login: 'jdoe131',
          avatar_url: 'http://article.com/avatar_url',
          url: 'http://article.com',
          name: 'John Doe'
        }
      end

      before do
        allow_any_instance_of(Octokit::Client).to receive(
          :exchange_code_for_token).and_return('validaccesstoken')

        allow_any_instance_of(Octokit::Client).to receive(
            :exchange_code_for_token).and_return(user_data)
      end

      it "should save new user" do
        expect{ subject }.to change { User.count }.by(1)
        expect(User.last.name).to eq('John Doe')
      end
      
    end
    
  end
end
