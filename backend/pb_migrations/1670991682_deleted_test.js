migrate((db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("h2dk8biyph4ld4b");

  return dao.deleteCollection(collection);
}, (db) => {
  const collection = new Collection({
    "id": "h2dk8biyph4ld4b",
    "created": "2022-12-14 04:18:37.490Z",
    "updated": "2022-12-14 04:18:37.490Z",
    "name": "test",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "cypuegv0",
        "name": "test",
        "type": "text",
        "required": false,
        "unique": false,
        "options": {
          "min": null,
          "max": null,
          "pattern": ""
        }
      }
    ],
    "listRule": "",
    "viewRule": "",
    "createRule": "@request.auth.id != \"\"",
    "updateRule": "@request.auth.id != \"\"",
    "deleteRule": "@request.auth.id != \"\"",
    "options": {}
  });

  return Dao(db).saveCollection(collection);
})
