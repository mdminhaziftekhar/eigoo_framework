migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("9t16wb2ljlbvayd")

  // remove
  collection.schema.removeField("eqkrtumz")

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("9t16wb2ljlbvayd")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "eqkrtumz",
    "name": "productId",
    "type": "relation",
    "required": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "collectionId": "llxjjbbic7dgdwa",
      "cascadeDelete": true
    }
  }))

  return dao.saveCollection(collection)
})
