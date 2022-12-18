migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("g6ymc641a7mx81f")

  collection.deleteRule = null

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("g6ymc641a7mx81f")

  collection.deleteRule = ""

  return dao.saveCollection(collection)
})
