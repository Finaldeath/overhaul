//::///////////////////////////////////////////////
//:: Alias Helps Hermit
//:: act_ali_herhelp1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Alias promises to help the hermit
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    //Good points, some xp, but less than complete mission, journal update.
    object oPC = GetFirstPC();
    object oHermit = GetObjectByTag("q1_thehermit");
    object oHive = GetObjectByTag("q1_poisonhive");
    object oDagger = GetItemPossessedBy(oHive,"q1_poisondagger");
    if(GetIsObjectValid(oDagger))
    {
        DestroyObject(oDagger);
    }
    DestroyObject(oHive);
    SetLocalInt(GetFirstPC(), "OS_HELPDRUID",40);
    AdjustAlignment(oPC,ALIGNMENT_GOOD,5);
    if(os_GetXPReceived())
    {
        os_SetXPReceived();
        GiveXPToCreature(oPC,400);
    }
}
