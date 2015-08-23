module Mysterious
  module Tasks
    class Update < Commands::Command
      def call(identity, attributes)
        return nil unless context.authorize(:write, :tasks)

        task = find_task(identity)
        return unless task

        if task.update_attributes(filter(attributes))
          publish(:task_updated, task)
        else
          publish(:task_updating_failed, task)
        end
        task
      end

      private

      def find_task(identity)
        task = context.tasks.find_by(id: identity)
        publish(:task_not_found, identity) unless task
        task
      end

      def filter(attributes)
        Filter.transform(attributes)
      end

      Filter = Spine::Transform.define do
        copy :name
        date :due
        timestamp :completed_at
      end
    end
  end
end
