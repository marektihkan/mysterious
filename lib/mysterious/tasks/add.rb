module Mysterious
  module Tasks
    class Add < Commands::Command
      def call(attributes)
        return nil unless context.authorize(:write, :tasks)

        task = context.user.tasks.build(attributes)
        if task.save
          publish(:task_added, task)
        else
          publish(:task_adding_failed, task)
        end
        task
      end
    end
  end
end
