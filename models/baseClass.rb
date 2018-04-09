class BaseClass

    def self.delete_table()

    end

    def self.table_name(table_name)
        @table_name = table_name
    end

    def self.columns(hash)
        @columns = hash
    end

    def self.create_table(db)
        @db = db
        unless self.table_exists?
            # column_name = @columns.keys.join(", ")
            # column_type = @columns.values
            @columns_joined = self.join_columns(@columns)

            @db.execute("CREATE TABLE [schema_name].#{@table_name}()")
            #can i commit now???? 😅

        end
    end

    def self.insert(hash)

    end

    def self.table_exists?
        return @db.execute("SELECT name FROM sqlite_master WHERE type='table' AND name='#{@table_name}'")
    end

    def self.join_columns(hash)    #parse_columns instead of join_columns?
        return hash.keys.join(", ")
    end

end
