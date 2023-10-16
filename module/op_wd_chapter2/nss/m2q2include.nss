//::///////////////////////////////////////////////
//:: M2Q2Include.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Include file for ease of use.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: January 24, 2002
//:://////////////////////////////////////////////

int PlayerHasScroll(object oPC)
{
    object oItem = GetItemPossessedBy(oPC, "M2Q2CD07_SCROLL");
    if (GetIsObjectValid(oItem) == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}

int PlayerHasRing(object oPC)
{
    object oItem = GetItemPossessedBy(oPC, "M2Q2CC06_SIGNET");
    if (GetIsObjectValid(oItem) == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
