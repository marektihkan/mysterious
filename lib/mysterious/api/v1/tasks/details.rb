module Mysterious
  module Api
    module V1
      module Tasks
        class Details < Action
          def action
            service = Mysterious::Tasks::Repository.new
            service.subscribe(self)
            service.find(parameters.symbolized[:id])
          end

          def on_task_not_found(identity)
            not_found
          end

          def on_task_found(task)
            success(serialize(task, :task))
          end
        end
      end
    end
  end
end
