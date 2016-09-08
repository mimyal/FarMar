# Remember: the datetime here loaded are not converted from string. Suggest require 'time' and Time.Parse(line[2])

module FarMar
  class Sale
# ID - (Fixnum) uniquely identifies the sale
# Amount - (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
# Purchase_time - (Datetime) when the sale was completed
# Vendor_id - (Fixnum) a reference to which vendor completed the sale
# Product_id - (Fixnum) a reference to which product was sold
    attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id
      @amount = amount # @todo program is not happy about this at the moment / 100
      @purchase_time = purchase_time
      @vendor_id = vendor_id
      @product_id = product_id
    end

    # @todo it returns an array, not a hash
    def self.all
      sales = {} # @todo START HERE START HERE this is what all goes wrong
      # CSV.read('support/sales.csv').each do |line|
      #   sale = self.new(line[0].to_i,line[1].to_f,line[2],line[3].to_i,line[4].to_i)
      #   sales[sale.id] = sale
      # end
    end

# VENDOR


    # def self.find(id)
    #   vendors = self.all
    #   return vendors[id]
    # end







  end #class
end #module
