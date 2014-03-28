module GraphvizAasm
  class Railtie < Rails::Railtie
    railtie_name :graphviz_aasm

    rake_tasks do
      load "tasks/graphviz_aasm.rake"
    end
  end
end
