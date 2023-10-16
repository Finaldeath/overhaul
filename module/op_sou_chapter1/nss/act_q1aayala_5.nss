//::///////////////////////////////////////////////
//:: Name act_q1aayala_5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Ayala stands up, turns towards the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 6/03
//:://////////////////////////////////////////////

void main()
{
    ActionPauseConversation();
    object oPC = GetPCSpeaker();
    SetFacingPoint(GetPosition(oPC));
    ActionResumeConversation();
}
