// Configura il file CSV e la collezione
const fs = require('fs');

const filePath = "C:/Users/laral/Desktop/SMBUD/SMBUD_Project/Book Recommendation/Books.csv";
const collection = db.Books;
//const filePath = "C:/Users/laral/Desktop/SMBUD/SMBUD_Project/career_change_prediction_dataset.csv";
//const collection = db.carrer;

// Funzione per leggere e parsare il CSV
function importCSV(filePath) {
    const lines = fs.readFileSync(filePath, 'utf8').split('\n');
    const headers = lines[0].split(',');

    lines.slice(1).forEach(line => {
        const values = line.split(',');
        if (values.length === headers.length) {
            const doc = {};
            headers.forEach((header, index) => {
                doc[header.trim()] = values[index].trim();
            });
            collection.insertOne(doc);
        }
    });
}

// Importa il CSV
importCSV(filePath);
print("Importazione completata!");
