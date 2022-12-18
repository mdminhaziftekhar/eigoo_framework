migrate((db) => {
  const collection = new Collection({
    "id": "2xuhbqsx2dsy4lv",
    "created": "2022-12-17 16:30:42.333Z",
    "updated": "2022-12-17 16:30:42.333Z",
    "name": "diary",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "fplzz87x",
        "name": "title",
        "type": "text",
        "required": true,
        "unique": false,
        "options": {
          "min": 3,
          "max": 30,
          "pattern": ""
        }
      },
      {
        "system": false,
        "id": "8qfhgebs",
        "name": "des",
        "type": "text",
        "required": false,
        "unique": false,
        "options": {
          "min": null,
          "max": null,
          "pattern": ""
        }
      },
      {
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
      },
      {
        "system": false,
        "id": "a6ymnd6a",
        "name": "image",
        "type": "file",
        "required": false,
        "unique": false,
        "options": {
          "maxSelect": 10,
          "maxSize": 5242880,
          "mimeTypes": [],
          "thumbs": []
        }
      },
      {
        "system": false,
        "id": "2uh8kg7w",
        "name": "favorite",
        "type": "bool",
        "required": false,
        "unique": false,
        "options": {}
      },
      {
        "system": false,
        "id": "fgzwy4ac",
        "name": "date",
        "type": "date",
        "required": false,
        "unique": false,
        "options": {
          "min": "",
          "max": ""
        }
      }
    ],
    "listRule": "",
    "viewRule": "",
    "createRule": "",
    "updateRule": "",
    "deleteRule": "",
    "options": {}
  });

  return Dao(db).saveCollection(collection);
}, (db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("2xuhbqsx2dsy4lv");

  return dao.deleteCollection(collection);
})
