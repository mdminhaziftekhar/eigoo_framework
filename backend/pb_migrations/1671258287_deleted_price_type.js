migrate((db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("b40lssor542hxnf");

  return dao.deleteCollection(collection);
}, (db) => {
  const collection = new Collection({
    "id": "b40lssor542hxnf",
    "created": "2022-12-17 04:52:01.343Z",
    "updated": "2022-12-17 04:52:01.343Z",
    "name": "price_type",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "7s0svpdy",
        "name": "title",
        "type": "text",
        "required": true,
        "unique": false,
        "options": {
          "min": 1,
          "max": 15,
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
})
