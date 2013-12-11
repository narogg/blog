class Post < ActiveRecord::Base
validates :title, presence: true,
                    length: { minimum: 5 }
validates :email, confirmation: true,
					length: { in: 6..50 ,
					message: "%{value} nije dulji od 6 a manji od 20, odjebi s tim borac!"}
end
