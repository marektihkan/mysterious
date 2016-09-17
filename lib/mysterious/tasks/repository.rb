module Mysterious
  module Tasks
    class Repository
      include Spine::Hub::Publisher

      def find(identity)
        task = tasks.find_by(id: identity)
        if task
          publish(:task_found, task)
        else
          publish(:task_not_found, identity)
        end
        task
      end

      def all
        result = tasks.all
        publish(:tasks_found, result)
        result
      end

      private

      def tasks
        Tasks::Task
      end
    end
  end
end

