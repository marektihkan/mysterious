module Mysterious
  module Api
    module V1
      module Tasks
        class Add < Action
          before :authenticate
          before :validate

          def action
            command(Mysterious::Tasks::Add).call(parameters.symbolized)
          end

          def on_task_added(task)
            success(serialize(task, :task))
          end

          def on_task_adding_failed(task)
            validation_failed(task.errors)
          end

          def validate
            parameters.required(:name)
              .timestamp(:completed_at)
              .timestamp(:due)

            if parameters.errors?
              invalid_request('Invalid parameters', parameters.errors)
            end
          end
        end
      end
    end
  end
end
