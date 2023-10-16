//::///////////////////////////////////////////////
//:: q3_init_hencrazy
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Henchmen go crazy
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();

    if(GetEnteringObject()== oPC
        && !os_CheckTriggerEntered())
    {
        object oJab = GetNearestObjectByTag("os_hen_jab");
        object oTrip = GetNearestObjectByTag("os_hen_trp");
        //if the PC is evil or has angered Jaboli sufficiently
        if(GetIsObjectValid(oJab)
            && (GetAlignmentGoodEvil(oPC)==ALIGNMENT_EVIL
            || GetLocalInt(GetFirstPC(), "OS_JAB_LIKE")<=40)
            || GetLocalInt(GetFirstPC(), "OS_JAB_HATE")==10)
        {
            os_SetTriggerEntered();
            SetLocalInt(GetFirstPC(), "OS_JABOLI_BETRAY",10);
            AssignCommand(oPC,ClearAllActions(TRUE));
            AssignCommand(oJab,ClearAllActions(TRUE));
            AssignCommand(oJab,ActionStartConversation(oPC));
            DestroyObject(OBJECT_SELF);
        }
        else if(GetIsObjectValid(oTrip))
        {
            os_SetTriggerEntered();
            SetLocalInt(oTrip,"OS_TRIP_BETRAY",10);
            AssignCommand(oPC,ClearAllActions(TRUE));
            AssignCommand(oTrip,ClearAllActions(TRUE));
            AssignCommand(oTrip,ActionStartConversation(oPC));
            DestroyObject(OBJECT_SELF);
        }
    }
}
