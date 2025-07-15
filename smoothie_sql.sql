-- Tabelle für Smoothie-Rezepte erstellen
CREATE TABLE smoothie_rezepte (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    kategorie VARCHAR(50) NOT NULL,
    zutaten TEXT[] NOT NULL,
    zubereitung TEXT NOT NULL,
    portionen INTEGER NOT NULL,
    kalorien INTEGER NOT NULL,
    zubereitungszeit VARCHAR(20) NOT NULL,
    protein VARCHAR(10),
    kohlenhydrate VARCHAR(10),
    fett VARCHAR(10),
    ballaststoffe VARCHAR(10),
    bild_url VARCHAR(255),
    bild_alt_text VARCHAR(200),
    erstellt_am TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index für bessere Performance bei Suchanfragen
CREATE INDEX idx_smoothie_kategorie ON smoothie_rezepte(kategorie);
CREATE INDEX idx_smoothie_name ON smoothie_rezepte(name);

-- Daten einfügen
INSERT INTO smoothie_rezepte (name, kategorie, zutaten, zubereitung, portionen, kalorien, zubereitungszeit, protein, kohlenhydrate, fett, ballaststoffe, bild_url, bild_alt_text) VALUES
('Grüner Power-Smoothie', 'Grün', 
 ARRAY['1 reife Banane', '2 Handvoll frischer Spinat', '1 Apfel (entkernt)', '1 EL Mandelbutter', '250ml Kokoswasser', '1 TL Chia-Samen', 'Saft von 1/2 Zitrone'],
 'Alle Zutaten in den Mixer geben und 60-90 Sekunden lang pürieren bis eine cremige Konsistenz entsteht.',
 1, 285, '5 Minuten', '6g', '58g', '8g', '11g', 'https://images.unsplash.com/photo-1610970881699-44a5587cabec', 'Grüner Smoothie mit Spinat und Banane'),

('Beeren-Vanille-Smoothie', 'Frucht',
 ARRAY['150g gemischte Beeren (Erdbeeren, Blaubeeren, Himbeeren)', '1 Banane', '200ml Mandelmilch', '2 EL Haferflocken', '1 TL Vanilleextrakt', '1 EL Honig', '5 Eiswürfel'],
 'Beeren waschen, Banane schälen und alles mit den übrigen Zutaten 1-2 Minuten mixen.',
 1, 245, '5 Minuten', '5g', '52g', '4g', '8g', 'https://images.unsplash.com/photo-1553530666-ba11a7da3888', 'Beeren-Smoothie mit gemischten Beeren'),

('Tropischer Mango-Smoothie', 'Tropisch',
 ARRAY['1 reife Mango (geschält und entkernt)', '1/2 Ananas (frisch oder gefroren)', '1 Banane', '200ml Kokosmilch', '1 EL Kokosraspel', 'Saft von 1 Limette', '1 TL frischer Ingwer (gerieben)'],
 'Mango und Ananas in Stücke schneiden, alle Zutaten mixen bis eine cremige Konsistenz erreicht ist.',
 1, 320, '7 Minuten', '4g', '65g', '9g', '7g', 'https://images.unsplash.com/photo-1570197788417-0e82375c9371', 'Tropischer Mango-Ananas-Smoothie'),

('Schokoladen-Erdnussbutter-Smoothie', 'Protein',
 ARRAY['1 Banane (gefroren)', '2 EL Erdnussbutter', '1 EL Kakaopulver (ungesüßt)', '250ml Hafermilch', '1 EL Ahornsirup', '1 TL Vanilleextrakt', '1 Handvoll Eiswürfel'],
 'Alle Zutaten in den Mixer geben und 90 Sekunden lang pürieren bis eine cremige Konsistenz entsteht.',
 1, 385, '5 Minuten', '12g', '48g', '18g', '8g', 'https://images.unsplash.com/photo-1578662996442-48f60103fc96', 'Schokoladen-Smoothie mit Erdnussbutter'),

('Rote Bete-Himbeer-Smoothie', 'Antioxidant',
 ARRAY['1 kleine gekochte Rote Bete', '150g Himbeeren', '1 Apfel (entkernt)', '200ml Cranberrysaft', '1 EL Leinsamen', '1 TL Honig', '1/2 TL Zimt'],
 'Rote Bete schälen und würfeln, mit allen anderen Zutaten 1-2 Minuten mixen.',
 1, 210, '6 Minuten', '4g', '48g', '3g', '9g', 'https://images.unsplash.com/photo-1553979459-d2229ba7433a', 'Rote Bete Smoothie mit Himbeeren'),

('Avocado-Gurken-Smoothie', 'Grün',
 ARRAY['1/2 reife Avocado', '1 Gurke (geschält)', '1 Apfel (entkernt)', '2 EL frische Minzblätter', '250ml Kokoswasser', 'Saft von 1 Limette', '1 TL Agavendicksaft'],
 'Avocado und Gurke grob zerkleinern, alle Zutaten mixen bis eine cremige Konsistenz erreicht ist.',
 1, 185, '5 Minuten', '3g', '32g', '8g', '8g', 'https://images.unsplash.com/photo-1623428187969-5da2dcea5ebf', 'Avocado-Gurken-Smoothie mit Minze'),

('Pfirsich-Ingwer-Smoothie', 'Frucht',
 ARRAY['2 reife Pfirsiche (entkernt)', '1 Banane', '200ml Mandelmilch', '1 EL frischer Ingwer (gerieben)', '1 EL Honig', '1/2 TL Kurkuma', '5 Eiswürfel'],
 'Pfirsiche schälen und entkernen, mit allen anderen Zutaten 1-2 Minuten pürieren.',
 1, 195, '6 Minuten', '4g', '45g', '3g', '6g', 'https://images.unsplash.com/photo-1600271886742-f049cd451bba', 'Pfirsich-Smoothie mit Ingwer'),

('Blaubeere-Banane-Smoothie', 'Antioxidant',
 ARRAY['200g Blaubeeren', '1 Banane', '150ml griechischer Joghurt', '100ml Mandelmilch', '1 EL Honig', '1 EL Mandelsplitter', '1 TL Vanilleextrakt'],
 'Blaubeeren waschen, alle Zutaten in den Mixer geben und 90 Sekunden lang pürieren.',
 1, 295, '5 Minuten', '15g', '52g', '6g', '7g', 'https://images.unsplash.com/photo-1505252585461-04db1eb84625', 'Blaubeeren-Bananen-Smoothie'),

('Karotten-Orangen-Smoothie', 'Vitamin',
 ARRAY['2 große Karotten (geschält und gekocht)', '2 Orangen (geschält und entkernt)', '1 Banane', '200ml Kokoswasser', '1 TL frischer Ingwer (gerieben)', '1 EL Honig', '1/2 TL Zimt'],
 'Karotten weich kochen und abkühlen lassen, dann mit allen anderen Zutaten 2 Minuten mixen.',
 1, 220, '8 Minuten', '4g', '54g', '1g', '8g', 'https://images.unsplash.com/photo-1621506289937-a8e4df240d0b', 'Karotten-Orangen-Smoothie'),

('Protein-Smoothie-Bowl', 'Protein',
 ARRAY['1 Banane (gefroren)', '150g gefrorene Beeren', '1 Messlöffel Vanille-Proteinpulver', '100ml Mandelmilch', '1 EL Mandelbutter', 'Toppings: Granola, Kokosflocken, frische Beeren'],
 'Alle Zutaten außer Toppings zu einer dicken Masse mixen, in eine Schüssel geben und mit Toppings garnieren.',
 1, 380, '7 Minuten', '28g', '42g', '12g', '9g', 'https://images.unsplash.com/photo-1511690743698-d9d85f2fbf38', 'Protein-Smoothie-Bowl mit Toppings');

-- Abfrage-Beispiele für die Datenbank
-- Alle Rezepte anzeigen
SELECT * FROM smoothie_rezepte ORDER BY name;

-- Rezepte nach Kategorie filtern
SELECT name, kalorien, zubereitungszeit FROM smoothie_rezepte WHERE kategorie = 'Protein';

-- Rezepte mit weniger als 250 Kalorien
SELECT name, kalorien, kategorie FROM smoothie_rezepte WHERE kalorien < 250 ORDER BY kalorien;

-- Rezepte mit bestimmten Zutaten suchen
SELECT name, zutaten FROM smoothie_rezepte WHERE 'Banane' = ANY(zutaten);

-- Durchschnittliche Kalorien pro Kategorie
SELECT kategorie, AVG(kalorien) as durchschnitt_kalorien 
FROM smoothie_rezepte 
GROUP BY kategorie 
ORDER BY durchschnitt_kalorien DESC;

-- Nährwerte-Statistik
SELECT 
    kategorie,
    COUNT(*) as anzahl_rezepte,
    AVG(kalorien) as avg_kalorien,
    MIN(kalorien) as min_kalorien,
    MAX(kalorien) as max_kalorien
FROM smoothie_rezepte 
GROUP BY kategorie;

-- Rezepte mit kurzer Zubereitungszeit (5 Minuten oder weniger)
SELECT name, zubereitungszeit, kategorie 
FROM smoothie_rezepte 
WHERE zubereitungszeit LIKE '%5 Minuten%' OR zubereitungszeit < '5 Minuten';

-- Volltext-Suche in Zubereitung
SELECT name, zubereitung 
FROM smoothie_rezepte 
WHERE zubereitung ILIKE '%mixer%' OR zubereitung ILIKE '%pürieren%';