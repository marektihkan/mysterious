module Mysterious
  module Tasks
    class Update < Commands::ContextAware
      include Finders::ByIdentity

      def call(identity, attributes)
        return nil unless context.authorize(:write, :tasks)

        task = find_task(identity)
        return unless task

        if task.update_attributes(filter(attributes))
          publish(:task_updated, context, task)
        else
          publish(:task_updating_failed, context, task)
        end
        task
      end

      private

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
