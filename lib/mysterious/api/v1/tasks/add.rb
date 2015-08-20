module Mysterious
  module Api
    module V1
      module Tasks
        class Add < Action
          before :authenticate

          def action
            service = Tasks::Add.new(context)
            service.subscribe(self)
            service.call(parameters)
          end

          def on_task_added(task)
            success(serialize(task, :task))
          end

          def on_task_adding_failed(task)
            validation_failed(task.errors)
          end
        end
      end
    end
  end
end
