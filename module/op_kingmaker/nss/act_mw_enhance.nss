//::///////////////////////////////////////////////
//:: act_mw_enhance
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The magic weapon gains a single enhancement bonus
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////
#include "x2_inc_itemprop"
void main()
{
//give the weapon an increase of +1/+1 enhancement
    object oPC = GetFirstPC();
    object oMW = GetItemPossessedBy(oPC,"os_magicweapon");
    int nEnhance = IPGetWeaponEnhancementBonus(oMW)+1;
    itemproperty iEnhance = ItemPropertyEnhancementBonus(nEnhance);

    IPSafeAddItemProperty
        (oMW,iEnhance,0.0,X2_IP_ADDPROP_POLICY_REPLACE_EXISTING,TRUE,TRUE);

    SetLocalInt(oMW,"OS_MW_ENHANCE_BONUS",nEnhance);
}
