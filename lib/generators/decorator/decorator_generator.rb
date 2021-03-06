module Rails
  module Generators
   class DecoratorGenerator < NamedBase
      source_root File.expand_path("../templates", __FILE__)
      check_class_collision :suffix => "Decorator"

      class_option :parent, :type => :string, :desc => "The parent class for the generated decorator"

      def create_decorator_file
        template 'decorator.rb', File.join('app/decorators', class_path, "#{file_name}_decorator.rb")
      end

      hook_for :test_framework

      private

      def parent_class_name
        if options[:parent]
          options[:parent]
        elsif defined?(ApplicationDecorator)
          "ApplicationDecorator"
        else
          "Draper::Base"
        end
      end
   end
  end
end
