require 'pry'
class Transfer
  
    attr_accessor :sender, :receiver, :amount, :status

    def initialize(sender, receiver, amount)
        @sender = sender
        @receiver = receiver
        @amount = amount
        @status = "pending"
    end

      def valid?
        true if @sender.valid? && @receiver.valid?
      end

      def execute_transaction
        
          if valid? && @sender.balance >= @amount && @status == "pending" 
            @sender.deposit(-@amount)
            @receiver.deposit(@amount)
            @status = "complete"
          else # if valid? == false
            @status = "rejected"
            "Transaction rejected. Please check your account balance."
          end
      end

      def reverse_transfer
        if @status == "complete"
              @sender.deposit(@amount)
              @receiver.deposit(-@amount)
              @status = "reversed"
        end

      end
    
    
end