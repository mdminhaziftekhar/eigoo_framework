migrate((db) => {
  const collection = new Collection({
    "id": "qisi6hn4cgr3e7d",
    "created": "2022-12-14 04:24:03.510Z",
    "updated": "2022-12-14 04:24:03.510Z",
    "name": "home_product",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "koemlxig",
        "name": "popular",
        "type": "relation",
        "required": false,
        "unique": false,
        "options": {
          "maxSelect": 50,
          "collectionId": "llxjjbbic7dgdwa",
          "cascadeDelete": false
        }
      },
      {
        "system": false,
        "id": "1jagmoih",
        "name": "budge",
        "type": "relation",
        "required": false,
        "unique": false,
        "options": {
          "maxSelect": 50,
          "collectionId": "llxjjbbic7dgdwa",
          "cascadeDelete": false
        }
      },
      {
        "system": false,
        "id": "zreac5gm",
        "name": "trending",
        "type": "relation",
        "required": false,
        "unique": false,
        "options": {
          "maxSelect": 50,
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
}, (db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("qisi6hn4cgr3e7d");

  return dao.deleteCollection(collection);
})
