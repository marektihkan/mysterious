module Mysterious
  module Api
    module V1
      module Tasks
        class Update < Action
          before :authenticate

          def action
            command(Mysterious::Tasks::Update)
              .call(parameters[:id], parameters.symbolized)
          end

          def on_task_not_found(_context, _identity)
            not_found
          end

          def on_task_updated(_context, task)
            success(serialize(task, :task))
          end

          def on_task_updating_failed(_context, task)
            validation_failed(task.errors)
          end
        end
      end
    end
  end
end
