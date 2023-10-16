//::///////////////////////////////////////////////
//:: Gem Conversation End
//:: act_gem_abort
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the Conversation gets aborted (which is protected
    by the cutscene) re-init.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    ActionStartConversation(oPC);
}
