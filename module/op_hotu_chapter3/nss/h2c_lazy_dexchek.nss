//::///////////////////////////////////////////////
//:: Lazy the Imp, Successful Dex Check (Condition Script)
//:: H2c_Lazy_DexChek.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player makes a successful
     Dex Check when dismantling the Grinder.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    //Calculate the player's dex check
    object oPC = GetPCSpeaker();
    int iDexMod = GetAbilityModifier(ABILITY_DEXTERITY, oPC);
    int id20 = d20(1);
    int iDexCheck = id20 + iDexMod;

    //For easy tweaking, take the DC from a variable set on the Grinder via the
    //toolset.
    int iDC = GetLocalInt(GetObjectByTag("QuarryGrinder5"), "iDismantleDC");

    if (iDexCheck >= iDC)
    {
        return TRUE;
    }
    return FALSE;
}
