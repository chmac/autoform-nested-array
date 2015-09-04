@ChildSchema = new SimpleSchema
  _id:
    type: String
    regEx: SimpleSchema.RegEx.Id
    autoValue: ->
      if @isInsert
        Random.id()
      else if @isUpsert
        $setOnInsert: Random.id()
      else
        @unset()
    autoform:
      omit: true
  age:
    type: Number

@Schema = new SimpleSchema
  name:
    type: String
  children:
    type: [@ChildSchema]

@Names = new Mongo.Collection 'names'

@Names.attachSchema @Schema

