module Mysterious
  module Api
    module V1
      module Tasks
        class Remove < Action
          before :authenticate

          def action
            service = Mysterious::Tasks::Remove.new(context)
            service.subscribe(self)
            service.call(parameters[:id])
          end

          def on_task_not_found(identity)
            not_found
          end

          def on_task_removed(task)
            success
          end
        end
      end
    end
  end
end
