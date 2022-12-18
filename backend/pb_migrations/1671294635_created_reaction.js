migrate((db) => {
  const collection = new Collection({
    "id": "g6ymc641a7mx81f",
    "created": "2022-12-17 16:30:35.463Z",
    "updated": "2022-12-17 16:30:35.463Z",
    "name": "reaction",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "v6hogoti",
        "name": "title",
        "type": "text",
        "required": true,
        "unique": false,
        "options": {
          "min": null,
          "max": null,
          "pattern": ""
        }
      }
    ],
    "listRule": null,
    "viewRule": null,
    "createRule": null,
    "updateRule": null,
    "deleteRule": null,
    "options": {}
  });

  return Dao(db).saveCollection(collection);
}, (db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("g6ymc641a7mx81f");

  return dao.deleteCollection(collection);
})
