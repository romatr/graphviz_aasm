namespace :aasm do
  desc "Draws AASM states using GraphViz (options: CLASS=User,Vehicle; TARGET=/folder/path ; ORIENTATION=portrait;)"
  task draw: :environment do
    options = {}
    options[:path]        = ENV['TARGET'] if ENV['TARGET']
    options[:orientation] = ENV['ORIENTATION'] if ENV['ORIENTATION']

    AASM::StateMachine.draw(ENV['CLASS'], options)
  end
end
