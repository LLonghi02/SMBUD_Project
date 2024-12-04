// Configura il file CSV e la collezione
const fs = require('fs');


const filePath = "C:/Users/laral/Desktop/SMBUD/SMBUD_Project/career_change_prediction_dataset.csv";
const collection = db.Carrer;


// Funzione per leggere e parsare il CSV

function importCSV(filePath) {
    const lines = fs.readFileSync(filePath, 'utf8').split('\n');
    const headers = lines[0].split(',');

    lines.slice(1).forEach((line, lineIndex) => {
        const values = line.split(',');
        const doc = {};

        headers.forEach((header, index) => {
            doc[header.trim()] = values[index] ? values[index].trim() : null; // Usa null se il valore manca
        });

        try {
            collection.insertOne(doc);
        } catch (e) {
            print(`Errore alla riga ${lineIndex + 1}: ${e.message}`);
        }
    });
}

// Importa il CSV
importCSV(filePath);
print("Importazione completata!");
