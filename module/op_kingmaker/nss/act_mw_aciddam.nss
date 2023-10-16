//::///////////////////////////////////////////////
//:: act_mw_aciddam
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The weapon now gives acid damage
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
        ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ACID,
        IP_CONST_DAMAGEBONUS_1d6);
//    AddItemProperty(DURATION_TYPE_PERMANENT,iProp,oMW);
    IPSafeAddItemProperty
        (oMW,iProp,0.0,X2_IP_ADDPROP_POLICY_IGNORE_EXISTING,TRUE,TRUE);
//    effect eDam = EffectDamageIncrease(DAMAGE_BONUS_1d6,DAMAGE_TYPE_ACID);
//    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eDam,oMW);
    SetLocalInt(oPC,"OS_MW_ACID",1);
}
