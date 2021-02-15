require 'rails_helper'

describe Representative do
    before(:each) do
        Asset.destroy_all
        Representative.destroy_all
    end

    let(:gme) { Asset.create(name: "Gamestop", date: Date.new(2020, 03, 03), dollar_amount: "333-555", reference: '123.pdf') } 
    let(:amc) { Asset.create(name: "AMC", date: Date.new(2020, 03, 03), dollar_amount: "50-150", reference: '123.pdf') }
    let(:tesla) { Asset.create(name: "Tesla", date: Date.new(2020, 03, 03), dollar_amount: "501-1000", reference: '123.pdf') }
    let(:bob) { Representative.create(name: 'Bob', district: 'GA13') }
    let(:bill) { Representative.create(name: 'Bill', district: 'FL23') }
    let(:jill) { Representative.create(name: 'Jill', district: 'WV12') }

    describe "#min_assets" do
        it 'returns the sum of the minimum of all of a reps assets' do
            bill.assets << gme << amc
            expect(bill.min_assets).to eq(383)
        end
    end
    describe '#max_assets' do 
        it 'returns the sum of the maximum of all of a reps assets' do
            bill.assets << gme << amc
            expect(bill.max_assets).to eq(705)
        end
    end
    describe '.richest_rep' do 
        it 'returns the information about the rep with the most assets' do
            bill.assets << gme
            jill.assets <<  tesla
            bob.assets << amc
            expect(Representative.richest_rep).to match_array([jill.id, "Jill", ["123.pdf"], ["Tesla"], "$501-$1,000"])
        end
    end 
end
