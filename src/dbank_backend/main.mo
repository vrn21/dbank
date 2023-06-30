import Debug "mo:base/Debug";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";

//this file is just made to learn how icp workss nothing actualy works over here


actor DBank{
  //ORTHOGONAL PERSISTENCE  (stable keyword)
  //there are two types of variables a flexible variable and a stable variable
  // default is flexible, if we use it, and did some writing to currentValue, 
  //then reload the page , currentValue will reset to initial value, 
  //we dont want that to happend so we use stable keyword in front of var
   var currentValue : Float = 300;
  currentValue := 300;
  
  //this is used to change value.
  //let val = 500;  creates a immutable variable
  
  //Debug.print(debug_show(currentValue));
  

//if the function is not public, the fn will only be called within the canister
//so inorder to call the fn outside we should use the public keyword
//Nat indicates the datatype NAtural numbers
// for using candid we should find caninster id of candid using dfx canister id __Candid_UI
//and find the canister id of the backend using dfx canister id dbank_backend
// and while we go to the link   http://127.0.0.1:4943/?canisterId=<CANDID-UI-CANISTER-IDENTIFIER> 
// and enter neccesary details
// to call a function from cli dfx canister call dbank_backend topUP 'arguement'

  stable var startingTime = Time.now();
// the out put will show something like 1_23_345_456_357_... etc the output just gives us theoutput in billions, millions thousands hundreds etc
// the output will be nanoseconds from the date 1970-1-1 

  public func topUP(amount : Float){
    currentValue += amount;
    Debug.print("The current Value is: "  );
    Debug.print(debug_show(currentValue));
  };
  //topUP(); 


  public func withdraw(amount : Float){
    let temp : Float = currentValue - amount;
    if (temp == 0){
      currentValue -= amount;
      Debug.print("The current Value is: "  );
      Debug.print(debug_show(currentValue));
  }else{
    Debug.print("Cannot do that, amount is greater than balance "  );
  }
  };

//query vs update , query is only for reading while updating is mainly used for writing, query takes very less time

  public query func checkBal(): async Float {
    return currentValue;
  };

  public func compound() {
    let endingTime = Time.now();
    let elapsedTimeNS = endingTime - startingTime;
    let elapsedTimeS = elapsedTimeNS/10000000000000;
    Debug.print(debug_show(startingTime));
    Debug.print(debug_show(endingTime));
    Debug.print(debug_show(elapsedTimeS));

    currentValue := currentValue *(1.01**Float.fromInt(elapsedTimeS));
    startingTime := elapsedTimeNS;
  };

}


//dfx start
//dfx deploy
//dfx resetatr