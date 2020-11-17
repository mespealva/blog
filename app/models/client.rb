class Client < User
    validates :full_name, presence: true
  
    def to_lawyers_time_zone(time:, layer:)
      lawyers_time_zone = "#{time} #{lawyer.parse_time_zone}"
      lawyers_time_zone.in_time_zone(parse_time_zone).no_dst
    end
  end