//::///////////////////////////////////////////////
//:: Quarry Grinder, Repair, Successful Int Check (Condition Script)
//:: H2c_Grind_IntChk.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player makes a successful
     Int Check when repairing the Grinder.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 22, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    //Calculate the player's dex check
    object oPC = GetPCSpeaker();
    int iIntMod = GetAbilityModifier(ABILITY_INTELLIGENCE, oPC);
    int id20 = d20(1);
    int iIntCheck = id20 + iIntMod;

    //For easy tweaking, take the DC from a variable set on the Grinder via the
    //toolset.
    int iDC = GetLocalInt(OBJECT_SELF, "iRepairDC");

    if (iIntCheck >= iDC)
    {
        return TRUE;
    }
    return FALSE;
}
