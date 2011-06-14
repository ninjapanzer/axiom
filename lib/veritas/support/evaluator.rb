# encoding: utf-8

module Veritas
  module Evaluator

    # Provide a context to evaluate a Relation operation block
    class Context < BasicObject

      # The functions to evaluate
      #
      # @return [Hash]
      #
      # @api private
      attr_reader :functions

      # Initialize a Context
      #
      # @param [Header] header
      #
      # @return [undefined]
      #
      # @api private
      def initialize(header)
        @header    = header
        @functions = {}
        yield self
        @functions.freeze
      end

      # Add a function to be evaluated by the summarization operation
      #
      # @example of a function
      #   context.add(:total, context[:unit_price] * context[:quantity])
      #
      # @example of a block
      #   context.add(:total) { |tuple| tuple[:unit_price] * tuple[:quantity] } }
      #
      # @param [Attribute, #to_ary, #to_sym] attribute
      #   the attribute to add to the header
      # @param [Object] object
      #   optional object
      #
      # @yield []
      #   optional block to execute in the summarization operation
      #
      # @return [self]
      #
      # @api public
      def add(attribute, object = Undefined, &block)
        object = block if object.equal?(Undefined)
        type   = Attribute.infer_type(object)
        functions[type.coerce(attribute)] = object
        self
      end

      # Lookup the attribute in the header
      #
      # @example
      #   attribute = context[name]
      #
      # @param [Symbol]
      #
      # @return [Attribute]
      #
      # @api public
      def [](name)
        @header[name]
      end

      # Test if the method is supported on this object
      #
      # @param [Symbol] name
      #
      # @return [Boolean]
      #
      # @api private
      def respond_to?(name, *)
        !!self[name]
      end

      # Forward a message to the object
      #
      # @param [Array] *args
      #
      # @return [Object]
      #
      # @api private
      def send(*args, &block)
        __send__(*args, &block)
      end

    private

      # Lookup the attribute in the header using the attribute name
      #
      # @example
      #   attribute = context.id
      #
      # @param [Symbol] name
      #
      # @return [Attribute]
      #
      # @api private
      def method_missing(name, *args)
        return super unless respond_to?(name)
        raise ArgumentError, "wrong number of arguments (#{args.length} for 0)" unless args.empty?
        self[name]
      end

    end # class Context
  end # module Evaluator
end # module Veritas
