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
            message.original.merge(body: message[:body])
          )
        end
      end
    end
  end
end
