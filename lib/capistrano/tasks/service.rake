Capistrano::Configuration.env.fetch(:services, []).each do |service|
  namespace :service do
    namespace service do
      desc "Restart service: #{service}"
      Rake::Task.define_task(:restart) do |t|
        on roles fetch(:"#{service}_roles", :all) do
          execute :sudo, :service, service, "restart"
        end
      end

      desc "Start service: #{service}"
      Rake::Task.define_task(:start) do |t|
        on roles fetch(:"#{service}_roles", :all) do
          execute :sudo, :service, service, "start"
        end
      end

      desc "Stop service: #{service}"
      Rake::Task.define_task(:stop) do |t|
        on roles fetch(:"#{service}_roles", :all) do
          execute :sudo, :service, service, "stop"
        end
      end

      desc "Status for service: #{service}"
      Rake::Task.define_task(:status) do |t|
        on roles fetch(:"#{service}_roles", :all) do
          info capture("sudo service #{service} status")
        end
      end
    end
  end
end
