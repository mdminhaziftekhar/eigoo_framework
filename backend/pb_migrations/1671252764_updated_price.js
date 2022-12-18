migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("9t16wb2ljlbvayd")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "m9hcbrxh",
    "name": "priceType",
    "type": "relation",
    "required": true,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "collectionId": "b40lssor542hxnf",
      "cascadeDelete": false
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("9t16wb2ljlbvayd")

  // remove
  collection.schema.removeField("m9hcbrxh")

  return dao.saveCollection(collection)
})
