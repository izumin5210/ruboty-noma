module Ruboty
  module Handlers
    class Noma < Base
      on(
        /noma (?<count>\d+) (?<body>.+)\z/m,
        name: :noma,
        description: ''
      )

      def noma(message)
        message[:count].to_i.times do
          robot.receive(
            message.original.merge(body: "#{message.body[prefix]}#{message[:body]}")
          )
        end
      end

      private

      def prefix
        Ruboty::Action.prefix_pattern(robot.name)
      end
    end
  end
end
