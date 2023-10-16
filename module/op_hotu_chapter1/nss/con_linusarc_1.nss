//::///////////////////////////////////////////////
//:: Name con_linusarc_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   check to see if the PC has a resurection spell memorized
   or the rod of ressurection
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 16/03
//:://////////////////////////////////////////////
//

int StartingConditional()
{
    object oPC = GetPCSpeaker();

    int iResult = GetHasSpell(SPELL_RESURRECTION, oPC);
    int iResult2 = GetHasSpell(SPELL_RAISE_DEAD, oPC);


    if (iResult == TRUE || iResult2 == TRUE)
        return TRUE;

    //See if the PC has a rod of ressurrection
    if (GetIsObjectValid(GetItemPossessedBy(oPC, "x2_rodresurrect")) == TRUE)
        return TRUE;

    return FALSE;
}
