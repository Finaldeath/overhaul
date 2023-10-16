//::///////////////////////////////////////////////
//:: act_mw_elecdam
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The weapon now gives electrical damage
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
        ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ELECTRICAL,
        IP_CONST_DAMAGEBONUS_1d4);
    IPSafeAddItemProperty
        (oMW,iProp,0.0,X2_IP_ADDPROP_POLICY_IGNORE_EXISTING,TRUE,TRUE);
//    AddItemProperty(DURATION_TYPE_PERMANENT,iProp,oMW);
//    effect eDam = EffectDamageIncrease(DAMAGE_BONUS_1d4,DAMAGE_TYPE_ELECTRICAL);
//    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eDam,oMW);
    SetLocalInt(oPC,"OS_MW_ELECTRIC",1);
}
