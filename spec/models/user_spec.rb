require "rails_helper"

RSpec.describe User, type: :model do

  let!(:user_1) {FactoryBot.create :user, email: "abc@gmail.com"}

  describe "association" do
    it { is_expected.to have_many(:bookings).dependent(:destroy) }
  end

  describe "validate password" do
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
    it { is_expected.to have_secure_password }
  end

  describe "validate email" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to allow_value("admin1@gmail.com").for(:email) }
    it { is_expected.to_not allow_value("foo").for(:email) }
  end

  describe "method" do
    subject {FactoryBot.create :user}

    it "with #digest with min cost" do
      ActiveModel::SecurePassword.min_cost = true
      expect(subject.digest subject.password).to match /^\$2[ayb]\$.{56}$/
    end

    it "with #digest with cost" do
      ActiveModel::SecurePassword.min_cost = false
      expect(subject.digest subject.password).to match /^\$2[ayb]\$.{56}$/
    end

    it "with #digest compare pass" do
      expect(subject.digest subject.password).not_to eql subject.password
    end
  end

end
