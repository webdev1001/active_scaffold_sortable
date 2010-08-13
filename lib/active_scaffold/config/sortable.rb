module ActiveScaffold::Config
  class Sortable < Base
    def initialize(core_config)
      @options = {}
      @core = core_config
      self.column = core_config.model.new.position_column if @core.model.instance_methods.include? 'acts_as_list_class'
      self.column = core_config.model.new.left_column_name if @core.model.instance_methods.include? 'nested_set_scope'
    end

    self.crud_type = :update
    
    attr_reader :column
    def column=(column_name)
      @column = @core.columns[column_name]
    end
    
    attr_accessor :options
  end
end