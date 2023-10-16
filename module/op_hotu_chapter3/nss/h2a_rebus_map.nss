//::///////////////////////////////////////////////
//:: City of Lost Souls Rebus Puzzle, Enable Map Note (Action Script)
//:: H2a_Rebus_MapNote.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Enables the map note corresponding to the
     pillar and spawn in a named pillar to replace
     the generic one.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 30, 2003
//:://////////////////////////////////////////////

void main()
{
    //Enable the corresponding map note.
    object oMapNote = GetNearestObjectByTag("H2_Rebus_MapNote");
    SetMapPinEnabled(oMapNote, TRUE);

    //Replace myself with the appropriate named pillar.
    string sName = GetName(oMapNote);
    location lLoc = GetLocation(OBJECT_SELF);
    CreateObject(OBJECT_TYPE_PLACEABLE, sName, lLoc);
    DestroyObject(OBJECT_SELF);
}
