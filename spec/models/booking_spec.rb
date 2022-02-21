require "rails_helper"

RSpec.describe Booking, type: :model do
  it "is valid with valid attributes" do
    expect(Booking.new).to_not be_valid
  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:tour) }
    it { should have_many(:guests).dependent(:destroy) }
  end

  describe "enums" do
    it "define status as an enum" do
      should define_enum_for(:status)
    end
  end

  describe "Validations" do
    let(:user){FactoryBot.create :user, name: "bacluong"}
    let(:tour){FactoryBot.create :tour, name: "bacluong"}
    let (:booking_1) {FactoryBot.create :booking, est_start_date: "25/1/2022", start_date: "30/11/2033", status: 1, user_id: user.id, tour_id: tour.id}

    context "with field user_name_at_order" do
      it { is_expected.to validate_presence_of(:est_start_date) }
    end

    context "est_start_date_must_before_start_date" do
      it "valid est_start_date_must_before_start_date" do
        expect(booking_1.est_start_date).to be <= booking_1.start_date
      end

      it "invalid est_start_date_must_before_start_date" do
        expect(booking_1.est_start_date).to_not eq booking_1.start_date
      end
    end
  end

  describe "Booking with valid attributes and nested guests attributes" do
    it { should accept_nested_attributes_for(:guests) }
  end
end
