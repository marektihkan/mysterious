module Mysterious
  module Tasks
    class Remove < Commands::Command
      def call(identity)
        return nil unless context.authorize(:delete, :tasks)

        task = find_task(identity)
        return unless task

        task.destroy
        publish(:task_removed, task)
        task
      end

      private

      def find_task(identity)
        task = context.tasks.find_by(id: identity)
        publish(:task_not_found, identity) unless task
        task
      end
    end
  end
end
