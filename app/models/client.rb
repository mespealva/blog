
class Client < User
    validates :full_name, presence: true
  using Refinements
  end