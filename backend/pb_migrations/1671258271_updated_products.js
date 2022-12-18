migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("llxjjbbic7dgdwa")

  // update
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
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("llxjjbbic7dgdwa")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "kxnrhhet",
    "name": "price",
    "type": "relation",
    "required": false,
    "unique": false,
    "options": {
      "maxSelect": 10,
      "collectionId": "9t16wb2ljlbvayd",
      "cascadeDelete": false
    }
  }))

  return dao.saveCollection(collection)
})
