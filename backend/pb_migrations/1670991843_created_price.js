migrate((db) => {
  const collection = new Collection({
    "id": "9t16wb2ljlbvayd",
    "created": "2022-12-14 04:24:03.509Z",
    "updated": "2022-12-14 04:24:03.509Z",
    "name": "price",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "ah6fn1vb",
        "name": "title",
        "type": "text",
        "required": true,
        "unique": false,
        "options": {
          "min": 1,
          "max": 30,
          "pattern": ""
        }
      },
      {
        "system": false,
        "id": "rsduksl3",
        "name": "price",
        "type": "number",
        "required": true,
        "unique": false,
        "options": {
          "min": null,
          "max": null
        }
      },
      {
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
}, (db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("9t16wb2ljlbvayd");

  return dao.deleteCollection(collection);
})
