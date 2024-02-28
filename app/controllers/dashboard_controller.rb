class DashboardController < ApplicationController
    def index

        
        # pegar a qauntidade de tasks com To Do
        @todo_count = ActiveRecord::Base.connection.execute("SELECT COUNT(*) FROM tasks WHERE status = 'To Do'")
        @todo = @todo_count.getvalue(0, 0) # formata o número para inteiro

        @doing_count = ActiveRecord::Base.connection.execute("SELECT COUNT(*) FROM tasks WHERE status = 'Doing'")
        @doing = @doing_count.getvalue(0, 0)

        @done_count = ActiveRecord::Base.connection.execute("SELECT COUNT(*) FROM tasks WHERE status = 'Done'")
        @done = @done_count.getvalue(0, 0)

        # pega os os meses de cada tarefa onde o status seja Done
        @meses_done = Task.where(status: 'Done').select("DISTINCT(EXTRACT(MONTH FROM created_at)) AS month").pluck(Arel.sql("EXTRACT(MONTH FROM created_at)"))
        @meses_done = @meses_done.map { |month| month.to_i } # converte as saídas para inteiro

    end
end
