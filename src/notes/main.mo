import List "mo:base/List";
import Debug "mo:base/Debug";


actor Notes {
  public type Note =  {
    title: Text;
    content: Text;

  };

  stable var notes: List.List<Note> = List.nil<Note>();

  public func createNote(titeText: Text, contentText: Text){
     let newNote: Note = {
       title = titeText;
       content = contentText;
     };

     notes:=  List.push(newNote, notes);

     Debug.print(debug_show(notes)); 
  };

  public  query func readNotes(): async [Note] {
    return List.toArray(notes);
  };

  public func removeNote(id: Nat){
    let listFront = List.take(notes, id);
    let backList = List.drop(notes, id + 1);
    notes := List.append(listFront, backList); 
  }
  
}
