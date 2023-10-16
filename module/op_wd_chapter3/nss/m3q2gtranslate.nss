//::///////////////////////////////////////////////
//:: M3Q2GTRANSLATE.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns trues if the PC speaker is NOT wearing
    a translation amulet
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "M3PLOTINCLUDE"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetIsObjectValid(oPC) == FALSE)
    {
        oPC = GetLastSpeaker();
    }
    int iResult;

    iResult = !PlayerWearsTranslationAmulet(oPC);
    return iResult;
}
