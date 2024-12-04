// Configura il file CSV e la collezione
const fs = require('fs');
/*const filePath = "C:/Users/laral/Desktop/SMBUD/SMBUD_Project/career_change_prediction_dataset.csv";
const collection = db.carrer_rec;*/

/*const filePath = "C:/Users/laral/Desktop/SMBUD/SMBUD_Project/Book Recommendation/Books.csv";
const collection = db.Books;*/

const filePath = "C:/Users/laral/Desktop/SMBUD/SMBUD_Project/Book Recommendation - MongoDB/Users.csv";
const collection = db.Users_Complete;

/*const filePath = "C:/Users/laral/Desktop/SMBUD/SMBUD_Project/Book Recommendation/Ratings.csv";
const collection = db.Ratings;*/

// Funzione per leggere e parsare il CSV

function importCSV(filePath, collection) {
    const lines = fs.readFileSync(filePath, 'utf8').split('\n');
    const headers = lines[0].split(',');

    lines.slice(1).forEach((line, lineIndex) => {
        const values = line.split(',');
        const doc = {};

        headers.forEach((header, index) => {
            let value = values[index] ? values[index].trim() : null;
            // Rimuove le virgolette dal valore, se presenti
            if (value && value.startsWith('"') && value.endsWith('"')) {
                value = value.slice(1, -1);
            }
            doc[header.trim()] = value;
        });

        try {
            collection.insertOne(doc);
        } catch (e) {
            console.log(`Errore alla riga ${lineIndex + 1}: ${e.message}`);
        }
    });
}

// Importa il CSV
importCSV(filePath);
print("Importazione completata!");
