# frozen_string_literal: true

class Task::Index < ActiveInteraction::Base # rubocop:disable Style/ClassAndModuleChildren
  def execute
    Task.all
  end
end
