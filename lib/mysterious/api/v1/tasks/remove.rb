module Mysterious
  module Api
    module V1
      module Tasks
        class Remove < Action
          before :authenticate

          def action
            command(Mysterious::Tasks::Remove).call(parameters[:id])
          end

          def on_task_not_found(_context, _identity)
            not_found
          end

          def on_task_removed(_context, _task)
            success
          end
        end
      end
    end
  end
end
