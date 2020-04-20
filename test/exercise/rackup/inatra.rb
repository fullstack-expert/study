module Inatra
  class << self
    def routes
    def method_missing(m, *args, &block)
      p m
    end


      yield
    # rescue NoMethodError => e
      p 'NOMETHODERROR'
      # args = e.args
      # method = e.name
      # send method.to_s, args

    end

    def call(env)
      path = env['PATH_INFO']
      method = env['REQUEST_METHOD']


      # p self.routes
      p '????????????????'

      # instance_eval "#{method.downcase}#{path.split('/').join('_')}"
    end

    # def method_missing(m, *args, &block)
      # p m
    # end

    def get(*args)
      p '!!!!!!'
      p args
      p block_given?
      if block_given?
        result = yield
        p result
      end
    end
  end
end

# [:args, :private_call?, :spell_checker, 
# :original_message, :corrections, :to_s,
# :receiver, :name, :local_variables, :cause, :respond_to?,
# :inspect, :==, :exception, :message, :full_message, :backtrace,
# :backtrace_locations, :set_backtrace, :stub, :to_yaml, :full?, 
# :all_full?, :present?, :blank?, :wont_be_same_as, :must_be_empty,
# :must_equal, :must_be_close_to, :must_be_within_delta, :must_be_within_epsilon,
# :must_include, :must_be_instance_of, :must_be_kind_of, :must_match, :must_be_nil,
# :must_be, :must_output, :must_raise, :must_respond_to, :must_be_same_as,
# :must_be_silent, :must_throw, :path_must_exist, :path_wont_exist,
# :wont_be_empty, :wont_equal, :wont_be_close_to, :wont_be_within_delta,
# :wont_be_within_epsilon, :wont_include, :wont_be_instance_of,
# :wont_be_kind_of, :wont_match, :wont_be_nil, :wont_be, :wont_respond_to, 
# :to_json, :dup, :itself, :yield_self, :then, :taint, :tainted?, :untaint,
# :untrust, :untrusted?, :trust, :frozen?, :methods, :singleton_methods, :protected_methods, 
# :private_methods, :public_methods, :instance_variables, :instance_variable_get, :instance_variable_set,
# :instance_variable_defined?, :remove_instance_variable, :instance_of?, :kind_of?, :is_a?, :tap, :clone, :display,
# :hash, :class, :singleton_class, :public_send, :method, :public_method, :singleton_method, :class_eval, 
# :define_singleton_method, :extend, :gem, :to_enum, :enum_for, :<=>, :===, :=~, :!~, :nil?, :eql?, :freeze, :object_id,
# :send, :__send__, :!, :!=, :equal?, :__id__, :instance_eval, :instance_exec]
# Loaded suite /bundle_cache/ruby/2.7.0/gems/rake-13.0.1/lib/rake/rake_test_loader
# Started
