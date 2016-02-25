module WebConsole
  class BindingTracer
    def initialize(exception)
      @bindings  = exception.bindings
      @backtrace = exception.backtrace
    end

    def binding_for_trace(trace)
    end
  end
end
