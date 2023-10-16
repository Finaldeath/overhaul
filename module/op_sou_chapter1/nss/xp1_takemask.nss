// Ayala takes the Mask from the PC

#include "NW_I0_PLOT"

void main()
{
    object oMask = GetItemPossessedBy(GetPCSpeaker(), "x1mask");
    DestroyObject(oMask);

    SetLocalInt(GetPCSpeaker(), "Mask_Quest", 1);
}
