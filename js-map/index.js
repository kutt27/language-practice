Array.prototype.myMap = function(callback){
    let result = []; // every map function creates an array without changing the original array

    for (let i = 0; i < this.length; i++){
        if(this.hasOwnProperty(i)){
            result.push(callback(this[i], i, this));
        }
    }
    return result; // return the operation array
};

const numbers = [1, 2, 3, 4];
const doubled = numbers.myMap(function(num) {
  return num * 2;
});

console.log(doubled);