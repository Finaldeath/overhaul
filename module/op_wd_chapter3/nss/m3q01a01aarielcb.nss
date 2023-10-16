/////  Advance Romance, take first Amulet, give second Amulet

#include "NW_I0_Plot"

void main()

{
    if(!GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"AARIN_AMULET2")))
    {
        ActionTakeItem(GetItemPossessedBy(GetPCSpeaker(), "AARIN_AMULET"), GetPCSpeaker());
        CreateItemOnObject( "AARIN_AMULET2", GetPCSpeaker());
    }
}

