module Refinery
  module Contents
    class Content < Refinery::Core::BaseModel
      self.table_name = 'refinery_contents'


      validates :title, :presence => true, :uniqueness => true

      belongs_to :thumbnail, :class_name => '::Refinery::Image'

      belongs_to :file, :class_name => '::Refinery::Resource'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

      def get_json
        json = { :title => title, :thumbnail => thumbnail.url, :content => file.url }.to_json

        return json
      end

    end
  end
end
