//::///////////////////////////////////////////////
//:: Conversation
//:: m2q3TalkedToMe
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets a local on the PC telling that the
    PC has talked to this particular NPC.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 28, 2001
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetPCSpeaker(),"NW_L_" + GetTag(OBJECT_SELF)) == 0)
    {
        SetLocalInt(GetPCSpeaker(),"NW_L_" + GetTag(OBJECT_SELF),10);
    }
}
