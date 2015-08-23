module Mysterious
  module Api
    module V1
      module Tasks
        class Update < Action
          before :authenticate

          def action
            service = Mysterious::Tasks::Update.new(context)
            service.subscribe(self)
            service.call(parameters[:id], parameters.symbolized)
          end

          def on_task_not_found(identity)
            not_found
          end

          def on_task_updated(task)
            success(serialize(task, :task))
          end

          def on_task_updating_failed(task)
            validation_failed(task.errors)
          end
        end
      end
    end
  end
end
