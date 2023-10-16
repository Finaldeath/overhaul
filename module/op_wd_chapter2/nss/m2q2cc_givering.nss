//::///////////////////////////////////////////////
//:: M2Q2CC_GIVERING.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Golem takes the ring from the PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: January 24, 2002
//:://////////////////////////////////////////////

void main()
{
    object oRing = GetItemPossessedBy(GetPCSpeaker(), "M2Q2CC06_SIGNET");
    if (GetIsObjectValid(oRing))
    {
        ActionPauseConversation();
        ActionTakeItem(oRing,GetPCSpeaker());
        ActionResumeConversation();
    }
/*    else
    {

    }*/
}
