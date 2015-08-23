module Mysterious
  module Tasks
    class Add < Commands::Command
      def call(attributes)
        return nil unless context.authorize(:write, :tasks)

        task = context.user.tasks.build(filter(attributes))

        if task.save
          publish(:task_added, task)
        else
          publish(:task_adding_failed, task)
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
