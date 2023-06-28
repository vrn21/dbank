import Debug "mo:base/Debug";
import Text "mo:base/Text";
import Nat "mo:base/Nat";



actor DBank{
  var currentValue = 300;
  currentValue := 100;
  //this is used to change value.
  //let val = 500;  creates a immutable variable
  Debug.print(debug_show(currentValue));
  

//if the function is not public, the fn will only be called within the canister
//so inorder to call the fn outside we should use the public keyword
//Nat indicates the datatype NAtural numbers
// for using candid we should find caninster id of candid using dfx canister id __Candid_UI
//and find the canister id of the backend using dfx canister id dbank_backend
// and while we go to the link   http://127.0.0.1:4943/?canisterId=<CANDID-UI-CANISTER-IDENTIFIER> 
// and enter neccesary details
// to call a function from cli dfx canister call dbank_backend topUP 'arguement'

  public func topUP(amount : Nat){
    currentValue += 1;
    Debug.print("The current Value is: "  );
    Debug.print(debug_show(currentValue));
  };
  //topUP(); 

}

//dfx start
//dfx deploy
