// Starting conditional for Ali: Player has the weapon of Al-Rashid.

#include "x1_inc_plot"

int StartingConditional()
{
    object oWeapon = GetItemPossessedBy(GetPCSpeaker(), "Q2_AL_RASHID_WEAPON");
    return oWeapon != OBJECT_INVALID;
}
