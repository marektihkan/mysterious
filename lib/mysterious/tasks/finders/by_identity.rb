module Mysterious
  module Tasks
    module Finders
      module ByIdentity
        def find_task(identity)
          task = tasks.find_by(id: identity)
          publish(:task_not_found, context, identity) unless task
          task
        end

        private

        def tasks
          context.tasks
        end
      end
    end
  end
end
