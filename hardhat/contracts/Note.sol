// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Note {
    //Note -> user can read note and read
    string myNote;
    //Access modifier
    //private, internal, external, public
    //Переменная состояния с public => создается getter
    //event NoteAdded(address noteSender, string addedNote);

    // Для всех непримитивных типов локальных переменных -> нужен memory
    // Для примитивных типов integer, boolean, address -> memory не нужен
    event NoteSubmitted(address sender, string note);
    
    
    function setNote(string memory _note) public {
        require(bytes(_note).length > 4, "Should have at least 5 characters");
        myNote = _note;
        emit NoteSubmitted(msg.sender, myNote);
        
        //emit NoteAdded(msg.sender, _note);
        // msg.sender => юзер или смарт-контракт, который вызывает данную функцию
    }

    //state mutability in function => pure, view (,Бесплатные), non payable (default), payable

    function getNote() public view returns (string memory) {
        return myNote;
    }

    //function multiplyByTwo() public pure returns(uint256){
        //return 4;
    //}

    function pureNote(
        string memory _pureNote
     ) public pure returns (string memory) {
        // pure вы даже не читаете state
        return _pureNote;
    }
}