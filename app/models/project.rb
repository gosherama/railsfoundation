class Project < ActiveRecord::Base
    has_many :tasks
    
    #when the Object is initiazed. It's goind to run this method
    after_initialize :set_defaults
    
    validates_presence_of :title, :description
    
    scope :almost_completed, -> { where('percent_complete > 75.0')}
    scope :still_need_work, -> { where('percent_complete < 75.0')}
    
    def set_defaults
        # conditional assignment operator - Check percent_complete.
        #if it has a value - OK 
        #if value is nil - It sets it to 0
        self.percent_complete ||= 0
    end
    
end
