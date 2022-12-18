migrate((db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("ekzrr20jvwgkaf7");

  return dao.deleteCollection(collection);
}, (db) => {
  const collection = new Collection({
    "id": "ekzrr20jvwgkaf7",
    "created": "2022-12-14 04:24:03.509Z",
    "updated": "2022-12-14 04:24:03.509Z",
    "name": "android_submissions",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "st7kayug",
        "name": "name",
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
        "id": "rb7a4p6h",
        "name": "approved",
        "type": "bool",
        "required": false,
        "unique": false,
        "options": {}
      },
      {
        "system": false,
        "id": "bujnwkxd",
        "name": "lock_screen",
        "type": "file",
        "required": false,
        "unique": false,
        "options": {
          "maxSelect": 1,
          "maxSize": 5242880,
          "mimeTypes": [],
          "thumbs": []
        }
      },
      {
        "system": false,
        "id": "0xk0udpo",
        "name": "home_screen",
        "type": "file",
        "required": false,
        "unique": false,
        "options": {
          "maxSelect": 1,
          "maxSize": 5242880,
          "mimeTypes": [],
          "thumbs": []
        }
      },
      {
        "system": false,
        "id": "o7atxvol",
        "name": "created_by_profile",
        "type": "relation",
        "required": false,
        "unique": false,
        "options": {
          "maxSelect": 2,
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
})
