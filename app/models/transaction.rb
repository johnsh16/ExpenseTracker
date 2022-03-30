class Transaction < ApplicationRecord
    validates :type, inclusion: {in: TRANSACTION_TYPES}
    #validates :class, inclusion: {in: CLASSIFICATIONS}

    belongs_to :account
    belongs_to :user

    TRANSACTION_TYPES = ["withdrawal", "deposit"]

    #I haven't added this to the db table yet...
    #...the idea is that the user could create categories of transactions outside of basic transaction type (above)...
    #...examples of classification could include "Transportation", "Groceries", etc. 
    #The problem is that the user would have to be able to populate this field themselves...
    #...I don't think a unique class (model) with its own SQL table is warranted is the best solution (maybe it is)...
    #...but the entries should be dynamic and persistent. I believe the below code might reset the available classifications at each "reboot"....
    #I would love to know what anyone thought about this!
    CLASSIFICATIONS = ['']

    
    #We discussed at the last meeting that we wouldn't actually delete transactions... 
    #...instead we will hide them.
    def hide
        visible = false
    end

    #I guess we may want to restore the visibility of a particular transaction.
    def restore
        visible = true
    end
end
