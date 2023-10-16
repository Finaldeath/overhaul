//::///////////////////////////////////////////////
//:: M2Q2CD_PLTSTRT.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This sets the variable so the next time you speak with the golem,
    he recognizes you.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: January 24, 2002
//:://////////////////////////////////////////////

void main()
{
    ActionPauseConversation();
    SetLocalInt(GetPCSpeaker(),"M2Q2CD_L" + GetTag(OBJECT_SELF),1);
    ActionResumeConversation();
}
