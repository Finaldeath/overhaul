//::///////////////////////////////////////////////
//:: Kobold Encounter
//:: q3_enc_kobold
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Activates the kobold encounters if the kobolds have not received honey
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    if(GetEnteringObject()==oPC
        && GetLocalInt(oPC,"OS_KOBOLD_HONEY")!=10
        && os_CheckTriggerEntered())
    {
//        SetEncounterActive(TRUE);
        os_SetTriggerEntered();
    }
}
