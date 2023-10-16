//::///////////////////////////////////////////////
//:: act_mw_confusion
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The weapon now does confusion
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

//    IPRemoveMatchingItemProperties
//        (oMW,ITEM_PROPERTY_ON_HIT_PROPERTIES,
//        DURATION_TYPE_PERMANENT,
//        IP_CONST_ONHIT_DAZE);

    itemproperty iProp =
        ItemPropertyOnHitProps(IP_CONST_ONHIT_CONFUSION,
        IP_CONST_ONHIT_SAVEDC_26,
        IP_CONST_ONHIT_DURATION_25_PERCENT_3_ROUNDS);
    IPSafeAddItemProperty
        (oMW,iProp,0.0,X2_IP_ADDPROP_POLICY_IGNORE_EXISTING,TRUE,TRUE);
//    AddItemProperty(DURATION_TYPE_PERMANENT,iProp,oMW);
    SetLocalInt(oPC,"OS_MW_DAZE",2);
}
