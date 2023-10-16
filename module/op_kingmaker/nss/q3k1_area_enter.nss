//::///////////////////////////////////////////////
//:: Area On Enter
//:: q3k1_area_enter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Illithid Caves On Enter Script
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    if(GetEnteringObject()==oPC)
    {
        if(os_CheckAreaEntered())
        {
            DoSinglePlayerAutoSave();
            os_SetAreaEntered();
        }
        object oGord = GetObjectByTag("q2_thegord");
        if(GetLocalInt(oPC,"os_serahcaves")>=30)
        {
            object oGoblin = GetObjectByTag("q3_enc_igoblin");
            SetEncounterActive(FALSE, oGoblin);
        }
        object oHermit = GetObjectByTag("q1_thehermit");
        if(GetLocalInt(GetModule(), "OS_THEGORD_COWS")>=30
            || GetLocalInt(oPC,"OS_KOBOLD_HONEY")==10
            || GetLocalInt(oHermit,"OS_HONEY_THIEF")>=10)
        {
            object oKobold = GetObjectByTag("q3_enc_ikobold");
            SetEncounterActive(FALSE,oKobold);
        }
        if(GetLocalInt(GetModule(), "OS_THEGORD_DWARF")>=30)
        {
            object oDuer = GetObjectByTag("q3_enc_iduergar");
            SetEncounterActive(FALSE,oDuer);
        }
    }
}
