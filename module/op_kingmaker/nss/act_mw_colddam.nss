//::///////////////////////////////////////////////
//:: act_mw_colddam
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The weapon now gives cold damage
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

#include "x2_inc_itemprop"
void main()
{
    object oPC = GetFirstPC();
    object oMW = GetItemPossessedBy(oPC,"os_magicweapon");
    itemproperty iProp =
        ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_COLD,
        IP_CONST_DAMAGEBONUS_2);
    IPSafeAddItemProperty
        (oMW,iProp,0.0,X2_IP_ADDPROP_POLICY_IGNORE_EXISTING,TRUE,TRUE);
//    AddItemProperty(DURATION_TYPE_PERMANENT,iProp,oMW);
//    effect eDam = EffectDamageIncrease(DAMAGE_BONUS_2,DAMAGE_TYPE_COLD);
//    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eDam,oMW);
    SetLocalInt(oPC,"OS_MW_COLD",1);
}
