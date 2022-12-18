migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("9t16wb2ljlbvayd")

  // add
  collection.schema.addField(new SchemaField({
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
  }))

  // add
  collection.schema.addField(new SchemaField({
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
  }))

  // add
  collection.schema.addField(new SchemaField({
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
  }))

  // update
  collection.schema.addField(new SchemaField({
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
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("9t16wb2ljlbvayd")

  // remove
  collection.schema.removeField("wf15ng5b")

  // remove
  collection.schema.removeField("gsqbtg1d")

  // remove
  collection.schema.removeField("fkphvlvy")

  // update
  collection.schema.addField(new SchemaField({
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
  }))

  return dao.saveCollection(collection)
})
