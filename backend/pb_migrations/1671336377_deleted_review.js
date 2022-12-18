migrate((db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("vh1zq9mnob2dz7w");

  return dao.deleteCollection(collection);
}, (db) => {
  const collection = new Collection({
    "id": "vh1zq9mnob2dz7w",
    "created": "2022-12-14 04:24:03.510Z",
    "updated": "2022-12-14 04:24:03.510Z",
    "name": "review",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "onfoilkd",
        "name": "rating",
        "type": "number",
        "required": true,
        "unique": false,
        "options": {
          "min": 1,
          "max": 5
        }
      },
      {
        "system": false,
        "id": "jx0a0bze",
        "name": "description",
        "type": "text",
        "required": false,
        "unique": false,
        "options": {
          "min": 3,
          "max": 100,
          "pattern": ""
        }
      },
      {
        "system": false,
        "id": "h46yl2yj",
        "name": "product",
        "type": "relation",
        "required": true,
        "unique": false,
        "options": {
          "maxSelect": 1,
          "collectionId": "llxjjbbic7dgdwa",
          "cascadeDelete": false
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
