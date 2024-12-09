db.Carrer.updateMany(
  {},
  [
    {
      $set: {
        // Trasforma ogni campo del documento
        allFields: {
          $arrayToObject: {
            $map: {
              input: { $objectToArray: "$$ROOT" }, // Converte il documento in array di key-value
              as: "field",
              in: {
                k: "$$field.k", // Mantiene la chiave invariata
                v: {
                  $cond: [
                    {
                      // Verifica se il valore è una stringa numerica
                      $and: [
                        { $eq: [{ $type: "$$field.v" }, "string"] },
                        { $regexMatch: { input: "$$field.v", regex: /^[0-9]+$/ } }
                      ]
                    },
                    { $toInt: "$$field.v" }, // Converte in numero se è una stringa numerica
                    "$$field.v" // Altrimenti, mantiene il valore originale
                  ]
                }
              }
            }
          }
        }
      }
    },
    {
      $replaceRoot: { newRoot: "$allFields" } // Ripristina il documento al formato originale
    }
  ]
)
