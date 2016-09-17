module Mysterious
  module Tasks
    class Remove < Commands::ContextAware
      include Finders::ByIdentity

      def call(identity)
        return nil unless context.authorize(:delete, :tasks)

        task = find_task(identity)
        return unless task

        task.destroy
        publish(:task_removed, context, task)
        task
      end
    end
  end
end
