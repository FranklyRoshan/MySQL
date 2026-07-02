
/*

🔹 SOUNDEX() Function	
The SOUNDEX() function converts a string into a phonetic code (based on how it sounds in English).
It helps you compare words that sound similar, even if they’re spelled differently.

🧩 Syntax:
SOUNDEX(string)

| Parameter | Description                                     |
| --------- | ----------------------------------------------- |
| `string`  | The input text you want to compare phonetically |

*/

-- 🧠 Example 1 — Basic Usage
SELECT SOUNDEX('Frank'), SOUNDEX('Frnk');
-- F652  |  F652
-- 👉 Both produce the same code, meaning they sound similar.

-- 🧠 Example 2 — Comparing with =
SELECT SOUNDEX('Smith') = SOUNDEX('Smyth') AS SimilarSound;
-- 1 means True — both names sound alike.

-- 🧠 Example 3 — With WHERE clause
SELECT name
FROM Employees
WHERE SOUNDEX(name) = SOUNDEX('Roshan');
-- ✅ This finds all names in the table that sound like “Roshan”, even if slightly misspelled (like Rosan, Roson, etc.).

/*

💡 How it works (Internally)
Keeps the first letter of the word.
Converts the rest into numeric digits based on sound groups (e.g., B/F/P/V = 1).
Pads or truncates the result to a 4-character code (e.g., R250).

*/

/*

| Example            | SOUNDEX() Output | Meaning               |
| ------------------ | ---------------- | --------------------- |
| `SOUNDEX('Frank')` | `F652`           | Phonetic code         |
| `SOUNDEX('Frnk')`  | `F652`           | Same sound as ‘Frank’ |
| `SOUNDEX('Smith')` | `S530`           | Sounds like “Smyth”   |
| `SOUNDEX('Smyth')` | `S530`           | Matches “Smith”       |

*/
