// Ayala takes the Tooth from the PC

#include "NW_I0_PLOT"

void main()
{
    object oTooth = GetItemPossessedBy(GetPCSpeaker(), "x1dragontooth");
    DestroyObject(oTooth);

    SetLocalInt(GetPCSpeaker(), "Tooth_Quest", 1);
}
