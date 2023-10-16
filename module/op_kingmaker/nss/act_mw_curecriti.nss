//::///////////////////////////////////////////////
//:: act_mw_curecriti
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The weapon now cures critical wounds
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
//    itemproperty iOld =
//        ItemPropertyCastSpell(IP_CONST_CASTSPELL_CURE_MODERATE_WOUNDS_3,
//        IP_CONST_CASTSPELL_NUMUSES_1_USE_PER_DAY);
    IPRemoveMatchingItemProperties(oMW,
        ITEM_PROPERTY_CAST_SPELL,
        DURATION_TYPE_PERMANENT,
        IP_CONST_CASTSPELL_CURE_MODERATE_WOUNDS_10);
    itemproperty iProp =
        ItemPropertyCastSpell(IP_CONST_CASTSPELL_CURE_CRITICAL_WOUNDS_15,
        IP_CONST_CASTSPELL_NUMUSES_1_USE_PER_DAY);
//    RemoveItemProperty(oMW,iOld);
    IPSafeAddItemProperty
        (oMW,iProp,0.0,X2_IP_ADDPROP_POLICY_IGNORE_EXISTING,TRUE,TRUE);
//    AddItemProperty(DURATION_TYPE_PERMANENT,iProp,oMW);
    SetLocalInt(oPC,"OS_MW_LIGHT",3);
}
