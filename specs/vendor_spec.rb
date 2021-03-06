require_relative 'spec_helper'
module FarMar

  describe Vendor do
    describe "#initialize" do
      let(:vendor) { Vendor.new(:id, :name, :number_of_employees, :market_id) }
      it "can create an instance of Vendor" do
        vendor.must_be_instance_of(Vendor)
      end
      # test below passed once there was attr_readers, instance variables not needed
      it "must respond to (have parameters of) of vendor information" do
        vendor.must_respond_to(:id)
        vendor.must_respond_to(:name)
        vendor.must_respond_to(:number_of_employees)
        vendor.must_respond_to(:market_id)
      end
    end

    describe "#self.all" do

      it "should return a hash" do
        Vendor.all.must_be_instance_of(Hash)
      end
      it "should return information about vendors" do
        # first listed vendor
        Vendor.all[1].id.must_equal(1)
        Vendor.all[1].name.must_equal("Feil-Farrell")
        Vendor.all[1].number_of_employees.must_equal(8)
        Vendor.all[1].market_id.must_equal(1)
        # last listed vendor
        Vendor.all[2690].id.must_equal(2690)
        Vendor.all[2690].name.must_equal("Mann-Lueilwitz")
        Vendor.all[2690].number_of_employees.must_equal(4)
        Vendor.all[2690].market_id.must_equal(500)
      end
      it "should be a collection of Vendor objects" do
        Vendor.all.each do |vendor_id, vendor|
          vendor_id.must_equal(vendor.id)
          vendor.must_be_instance_of(Vendor)
        end
      end
    end #self.all

    describe "#self.find(id)" do
      it "should return an instance of a Vendor object of a certain id" do
        random_vendor_id = rand(1..2690)
        Vendor.find(random_vendor_id).must_be_instance_of(Vendor)
        Vendor.find(random_vendor_id).id.must_equal(random_vendor_id)
      end
    end #self.find(id)

    describe "#market" do
      before(:each) do
        @vendor = Vendor.new(:id, :name, :number_of_employees, :market_id)
      end
      it "should reutrn the Market instance that it is associated to" do
        @vendor.market.must_equal(@vendor.market_id)
      end
    end

    describe "#products" do
      it "should return a collection of Product instances associated to specific vendor" do
        all_vendors = Vendor.all
        random_vendor_id = rand(1..2690)
        random_vendor = all_vendors[random_vendor_id]
        random_vendor.products.each do |product_id, product|
          product.vendor_id.must_equal(random_vendor_id)
        end
      end
    end

    describe "#sales" do
      it "should return the sales associated to the instance of Vendor" do
        all_vendors = Vendor.all
        random_vendor_id = rand(1..2690)
        random_vendor = all_vendors[random_vendor_id]
        random_vendor.sales.each do |sale_id, sale|
          sale.vendor_id.must_equal(random_vendor_id)
        end
      end
    end

    # Here is the specific vendor revenue for vendor 1: 38259 cents
    describe "#revenue" do
      it "returns the sum of all of the vendor's sales (in cents)" do
        all_vendors = Vendor.all
        all_vendors[1].revenue.must_equal(38259) # [1] does not indicate array loc, instead hash key: 1
      end
    end

    describe "#self.by_market" do
      it "should return instances of Vendor" do
        random_market_id = rand(1..500)
        Vendor.by_market(random_market_id).each do |vendor_id, vendor|
          vendor.must_be_instance_of(Vendor)
        end
      end
    end
  end
end
