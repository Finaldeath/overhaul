// Ayala takes the Mummified Hand from the PC

#include "NW_I0_PLOT"

void main()
{
    object oHand = GetItemPossessedBy(GetPCSpeaker(), "mummifiedhand");


    DestroyObject(oHand);

    SetLocalInt(GetPCSpeaker(), "Hand_Quest", 1);
}
