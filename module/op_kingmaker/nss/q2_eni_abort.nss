//::///////////////////////////////////////////////
//:: q2_eni_abort
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the conversation aborts before the end of the first scene
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Dec 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    if(os_CheckTalkedTo(0))
    {
        object oPC = GetFirstPC();
        ActionStartConversation(oPC);
    }
}
