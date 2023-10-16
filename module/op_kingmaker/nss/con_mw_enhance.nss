//::///////////////////////////////////////////////
//:: con_mw_enhance
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks whether the weapon is ready for enhancement
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

#include "x2_inc_itemprop"
int StartingConditional()
{
//this can only be selected if the present bonus on the weapon is 1/2 or less of
//the player's total level. So for a +3 to hit, the pc must be 6th level or better.
    int iResult;
    object oPC = GetFirstPC();
    object oMW = GetItemPossessedBy(oPC,"os_magicweapon");
    int nBonus = IPGetWeaponEnhancementBonus(oMW);
    int nLevel = GetHitDice(oPC);

    iResult = (nBonus==0 && nLevel>=3)
        || (nBonus==1 && nLevel>=6)
        || (nBonus==2 && nLevel>=9)
        || (nBonus==3 && nLevel>=12)
        || (nBonus==4 && nLevel>=15)
        || (nBonus==5 && nLevel>=18)
        || (nBonus==6 && nLevel>=21)
        || (nBonus==7 && nLevel>=24)
        || (nBonus==8 && nLevel>=27)
        || (nBonus==9 && nLevel>=30);
    return iResult;
}
