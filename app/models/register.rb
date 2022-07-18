class Register < ApplicationRecord
    has_secure_password
    def get_data
        "#{name} #{main}"
    end
end
