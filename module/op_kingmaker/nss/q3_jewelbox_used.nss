//::///////////////////////////////////////////////
//:: Box OnUsed
//:: q3_jewelbox_used
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates the ghost and starts a conversation with the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    if(!os_CheckTriggerEntered())
    {
        os_SetTriggerEntered();
        location lLoc = GetLocation(OBJECT_SELF);
        object oPC = GetFirstPC();
        object oGhost = CreateObject(OBJECT_TYPE_CREATURE,"q3_ghost",lLoc,TRUE);
        AssignCommand(oPC,ClearAllActions(TRUE));
        DelayCommand(0.5,AssignCommand(oGhost,ActionStartConversation(oPC)));
    }
}
