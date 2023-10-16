//::///////////////////////////////////////////////
//:: m2q3H Guardian Spirit Condition Script #8
//:: m2q3H_Guardian8
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player has Quint's oath
    but not Karlat's
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 28, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oQuintOath = GetItemPossessedBy(oPC,"M2Q3_OATHQUINT");
    object oKarlatOath = GetItemPossessedBy(oPC,"M2Q3_OATHKARLAT");

    if (GetIsObjectValid(oQuintOath) && !GetIsObjectValid(oKarlatOath))
    {
        return TRUE;
    }
    return FALSE;
}

