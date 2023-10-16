//::///////////////////////////////////////////////
//:: Magic Weapon Started
//:: q3ai_mw_started
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The conversation with the magic weapon has been started
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    location lRat = GetLocation(GetObjectByTag("km_spwn_rat1"));
    location lDire = GetLocation(GetObjectByTag("km_spwn_rat2"));
    CreateObject(OBJECT_TYPE_CREATURE,"q3ai_cal_rat",lRat);
    CreateObject(OBJECT_TYPE_CREATURE,"q3ai_cal_rat",lDire);
}
