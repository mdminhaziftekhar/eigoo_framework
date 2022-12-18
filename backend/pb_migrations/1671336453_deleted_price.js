migrate((db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("9t16wb2ljlbvayd");

  return dao.deleteCollection(collection);
}, (db) => {
  const collection = new Collection({
    "id": "9t16wb2ljlbvayd",
    "created": "2022-12-14 04:24:03.509Z",
    "updated": "2022-12-17 06:29:31.447Z",
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
        "name": "per_hour",
        "type": "number",
        "required": false,
        "unique": false,
        "options": {
          "min": null,
          "max": null
        }
      },
      {
        "system": false,
        "id": "wf15ng5b",
        "name": "per_day",
        "type": "number",
        "required": false,
        "unique": false,
        "options": {
          "min": null,
          "max": null
        }
      },
      {
        "system": false,
        "id": "gsqbtg1d",
        "name": "per_week",
        "type": "number",
        "required": false,
        "unique": false,
        "options": {
          "min": null,
          "max": null
        }
      },
      {
        "system": false,
        "id": "fkphvlvy",
        "name": "per_month",
        "type": "number",
        "required": false,
        "unique": false,
        "options": {
          "min": null,
          "max": null
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
