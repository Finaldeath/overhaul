//::///////////////////////////////////////////////
//:: Name hx_onuse
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     A generic onuse script to fire a one-liner
     conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 15, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();

    AssignCommand(oPC, ClearAllActions(TRUE));
    ActionStartConversation(oPC);
}
