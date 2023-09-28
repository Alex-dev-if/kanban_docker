class DashboardController < ApplicationController
    def index
        result_todo = ActiveRecord::Base.connection.execute('SELECT todo FROM colunas')
        result_doing = ActiveRecord::Base.connection.execute('SELECT doing FROM colunas')
        result_done = ActiveRecord::Base.connection.execute('SELECT done FROM colunas')

        @todo = []
        result_todo.each do |row|
          @todo << row['todo']
        end

        @doing = []
        result_doing.each do |row|
          @doing << row['doing']
        end

        @done = []
        result_done.each do |row|
          @done << row['done']
        end

        @unique_months = Task.select("DISTINCT(EXTRACT(MONTH FROM created_at)) AS month").pluck(Arel.sql("EXTRACT(MONTH FROM created_at)"))
        @unique_months = @unique_months.map { |month| month.to_i }
        @meses_done = Task.where(status: 'Done').select("DISTINCT(EXTRACT(MONTH FROM created_at)) AS month").pluck(Arel.sql("EXTRACT(MONTH FROM created_at)"))
        @meses_done = @meses_done.map { |month| month.to_i }

    end
end
