module Concerns

  module  Slugifiable

    module InstanceMethods
      def slug
        self.name.downcase.split.join("-")
      end
    end

    module ClassMethods
      def find_by_slug(slug)
        self.all.detect {|o| o.slug == slug}
      end
    end

  end

end
