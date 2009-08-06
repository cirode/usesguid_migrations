module Lfe::Usesguid::Migrations::ActiveRecord::ConnectionAdapters
  module MysqlAdapter
    def self.included(base)
      base.class_eval do
        
      end
    end

    def primary_key_name( table_name, name=nil )
      results = execute( "SHOW CREATE TABLE `#{table_name}`", name )
      keys = []
      primary_key = nil

      results.each do |row|
        row[1].each do |line|
          keys << $1 if line =~ /^  [`"](.+?)[`"] varchar\(22\) character set latin1 collate latin1_bin NOT NULL?,?$/
          primary_key = $1 if line =~ /^  PRIMARY KEY  \([`"](.+?)[`"]\)$/
        end
      end

      return keys.include?( primary_key ) ? primary_key : nil
    end

    def foreign_keys( table_name, name=nil )
      results = execute( "SHOW CREATE TABLE `#{table_name}`", name )

      foreign_keys = []
      primary_keys = []

      results.each do |row|
        row[1].each do |line|
          foreign_keys << $1 if line =~ /^  [`"](.+?)[`"] varchar\(22\) character set latin1 collate latin1_bin NOT NULL?,?$/
          primary_keys << $1 if line =~ /^  PRIMARY KEY  \([`"](.+?)[`"]\)$/
        end
      end

      foreign_keys - primary_keys
    end
  end
end