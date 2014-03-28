require "aasm"
require "aasm/graph"
require "graphviz_aasm/version"

module GraphvizAasm
  require "graphviz_aasm/railtie" if defined?(Rails)

  AASM::StateMachine.class_eval do
    def self.draw(class_names, options = {})
      raise ArgumentError, "At least one class must be specified" unless class_names && class_names.split(',').any?

      class_names.split(',').each do |class_name|
        klass = class_name.constantize

        graph = AASM::Graph.new(class_name, options)

        klass.aasm.states.each do |state|
          state.draw(graph)
        end

        klass.aasm.events.each_value do |event|
          event.draw(graph)
        end
        graph.output
      end
    end
  end

  AASM::State.class_eval do
    def draw(graph)
      node = graph.add_nodes(self.human_name, shape: final? ? "doublecircle" : "ellipse")
      graph.add_edge(graph.add_nodes("starting_state", shape: "point"), node) if initial?
    end

    def initial?
      @clazz.aasm.initial_state == self.name
    end

    def final?
      !@clazz.aasm.events.any? do |_, event|
        event.transitions.any? do |transition|
          transition.from == self.name
        end
      end
    end
  end

  AASM::Event.class_eval do
    def draw(graph)
      transitions.each do |transition|
        graph.add_edge(transition.from.to_s.capitalize, transition.to.to_s.capitalize)
      end
    end
  end
end
