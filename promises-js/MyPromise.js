class MyPromise {
  constructor(executer) {
    this.state = 'pending';
    this.value = null;
    this.reason = null;
    this.onFullfilledCallbacks = [];
    this.onRejectedCallbacks = [];
    
    const resolve = (value) => {
      if (this.state === 'pending') {
        this.state = 'fulfilled';
        this.value = value;
        // trigger all the function stored in onFullfilledCallbacks[]
        this.onFullfilledCallbacks.forEach(fn => fn(value));
      }
    };
    
    const reject = (reason) => {
      if (this.state === 'pending') {
        this.state = 'rejected';
        this.reason = reason;
        // same for this array as well
        this.onRejectedCallbacks.forEach(fn => fn(reason));
      }
    };
    
    try {
      executer(resolve, reject);
    } catch (err) {
      reject(err);
    }
  }
  
  then(onFulfilled, onRejected) {
    // ensure we have function to call
    onFulfilled = typeof onFulfilled === 'function' ? onFulfilled : val => val;
    onRejected = typeof onRejected === 'function' ? onRejected : err => { throw err };
  
    const promise2 = new MyPromise((resolve, reject) => {
      if (this.state === 'fulfilled') {
        queueMicrotask(() => { // syntax: queueMicrotask(callback) also promises are microtasks
          try {
            const x = onFulfilled(this.value);
            this.resolvePromise(promise2, x, resolve, reject);
          } catch (e) {
            reject(e);
          }
        });
      }
  
      if (this.state === 'rejected') {
        queueMicrotask(() => {
          try {
            const x = onRejected(this.reason);
            this.resolvePromise(promise2, x, resolve, reject);
          } catch (e) {
            reject(e);
          }
        });
      }
  
      if (this.state === 'pending') {
        this.onFullfilledCallbacks.push(() => {
          queueMicrotask(() => {
            try {
              const x = onFulfilled(this.value);
              this.resolvePromise(promise2, x, resolve, reject);
            } catch (e) {
              reject(e);
            }
          });
        });
  
        this.onRejectedCallbacks.push(() => {
          queueMicrotask(() => {
            try {
              const x = onRejected(this.reason);
              this.resolvePromise(promise2, x, resolve, reject);
            } catch (e) {
              reject(e);
            }
          });
        });
      }
    });
  
    return promise2;
  }; 
  resolvePromise(promise2, x, resolve, reject) {
    // If x is the same as promise2, it's a type error (infinite loop)
    if (promise2 === x) {
      return reject(new TypeError('Chaining cycle detected for promise'));
    }
  
    // If x is another MyPromise, wait for it to settle
    if (x instanceof MyPromise) {
      x.then(resolve, reject);
    } else {
      // Otherwise, just resolve with the value
      resolve(x);
    }
  }
}

const p = new MyPromise((resolve, reject) => {
  setTimeout(() => resolve("Success!"), 1000);
});

p.then(res => {
  console.log(res);
  return "Next link in chain";
}).then(res => {
  console.log(res);
});