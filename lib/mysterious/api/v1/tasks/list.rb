module Mysterious
  module Api
    module V1
      module Tasks
        class List < Action
          def action
            service = Mysterious::Tasks::Repository.new
            service.subscribe(self)
            service.all
          end

          def on_tasks_found(tasks)
            success(serialize_all(tasks, :task))
          end
        end
      end
    end
  end
end
