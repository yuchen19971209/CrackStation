# cs561-swift

## Crack Station
My swift package name is crack_station. If you want to implement to test the function, you should 
* import Crpto 
* @testable import crack_station

Then, You can **call function** which is named **crack** and give **hash String** as *input*, then the function will return *output* string that **hash String mapping**.

### (a) Clear description of what I built

* **Create dictionary** as *look up table*
* **Function crack(_ hash String)** to output hash mapping string 
* Unit test hash mapping **value not nil**
* Unit test when given *wrong String*, then **Assert** nil
* Unit test hash mapping if get **correct** return value

### (b) Instructions for how to run it

* Giving a hash String as parameter to call crack(), then saved and execute the below command line 

```
swift build
swift test --enable-code-coverage
```


