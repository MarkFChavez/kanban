module TaskPresenters
	class ShowPresenter
		extend ActiveSupport::Memoizable

		def initialize(project)
			@project = project
		end

		def todo
			@project.tasks.todo
		end

		def doing
			@project.tasks.doing
		end

		def done
			@project.tasks.done
		end

		memoize :todo, :doing, :done

	end
end