require "rails_helper"

RSpec.describe Tour, type: :model do
  it "is valid with valid attributes" do
    expect(Tour.new).to_not be_valid
  end

  describe "Associations" do
    it { should have_many(:bookings).dependent(:destroy) }
    it { should have_many(:guests).through(:bookings) }
  end

  describe "enums" do
    it "define status as an enum" do
      should define_enum_for(:sort)
    end
  end

  describe "Validations" do
    let(:tour){FactoryBot.create :tour}
    context "with field user_name_at_order" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:description) }
      it { is_expected.to validate_presence_of(:price) }
      it { is_expected.to validate_presence_of(:duration) }
    end
  end

  describe "remaining_tickets" do
    let(:tour){FactoryBot.create :tour}
    it "remaining_tickets" do
      expect(tour.max_guest).to be > tour.min_guest
    end
  end
end
