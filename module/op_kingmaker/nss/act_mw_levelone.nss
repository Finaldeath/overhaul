//::///////////////////////////////////////////////
//:: act_mw_levelone
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The magic weapon gains a +3 Attack bonus and +3 Damage bonus
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////
#include "x2_inc_itemprop"
void main()
{
    //give the weapon an increase of +3/+3 enhancement

    object oPC = GetFirstPC();
    object oMW = GetItemPossessedBy(oPC,"os_magicweapon");
    itemproperty iEnhance = ItemPropertyEnhancementBonus(3);

    IPSafeAddItemProperty
        (oMW,iEnhance,0.0,X2_IP_ADDPROP_POLICY_REPLACE_EXISTING,TRUE,TRUE);

    SetLocalInt(oMW,"OS_MW_ENHANCE_BONUS",3);
}
