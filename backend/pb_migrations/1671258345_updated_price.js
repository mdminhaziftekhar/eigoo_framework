migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("9t16wb2ljlbvayd")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "0itg2tn3",
    "name": "product",
    "type": "relation",
    "required": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "collectionId": "llxjjbbic7dgdwa",
      "cascadeDelete": false
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("9t16wb2ljlbvayd")

  // remove
  collection.schema.removeField("0itg2tn3")

  return dao.saveCollection(collection)
})
