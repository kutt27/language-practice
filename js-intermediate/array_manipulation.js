// Write a function groupBy that takes an array and a callback function, then returns an object where keys are the result of the callback and values are arrays of items that produced that key.

function groupBy(array, callback) {
    const result = {}; // testing
    for (const item of array) {
        // for each call we getting the key
        // can be string or number
        const key = callback(item);
        if (!result[key]) {
            result[key] = [];
        }
        result[key].push(item);
    }
    return result;
}

// Example:
const users = [
  { name: 'Alice', age: 25 },
  { name: 'Bob', age: 30 },
  { name: 'Charlie', age: 25 }
];

console.log(groupBy(users, user => user.age));
// Returns: { 25: [{...}, {...}], 30: [{...}] }