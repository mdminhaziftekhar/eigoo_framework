migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("llxjjbbic7dgdwa")

  // remove
  collection.schema.removeField("p6hmsw5y")

  // remove
  collection.schema.removeField("kxnrhhet")

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("llxjjbbic7dgdwa")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "p6hmsw5y",
    "name": "category_id",
    "type": "relation",
    "required": false,
    "unique": false,
    "options": {
      "maxSelect": 5,
      "collectionId": "zudr8mfyo0o48vj",
      "cascadeDelete": false
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "kxnrhhet",
    "name": "price",
    "type": "relation",
    "required": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "collectionId": "9t16wb2ljlbvayd",
      "cascadeDelete": false
    }
  }))

  return dao.saveCollection(collection)
})
