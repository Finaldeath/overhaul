#include "help_general"

int StartingConditional()
{
    string sArmorCheck = "Imperial";

    object oPC = GetPCSpeaker();

    object oHench = GetHenchman(oPC);

    if (GetObjectArmorString(oPC) == sArmorCheck || GetObjectArmorString(oHench) == sArmorCheck)
        return TRUE;

    return FALSE;
}
