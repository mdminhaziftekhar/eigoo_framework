migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("2xuhbqsx2dsy4lv")

  // remove
  collection.schema.removeField("wicct59p")

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("2xuhbqsx2dsy4lv")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "wicct59p",
    "name": "reaction",
    "type": "relation",
    "required": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "collectionId": "g6ymc641a7mx81f",
      "cascadeDelete": false
    }
  }))

  return dao.saveCollection(collection)
})
