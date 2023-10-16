//::///////////////////////////////////////////////
//:: Enter
//:: M2Q5BridgeGuard
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The bridge guard warns the PC that entry is
    restricted.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 17, 2001
//:://////////////////////////////////////////////

void main()
{
    if (GetIsPC(GetEnteringObject()) == TRUE)
    {
        AssignCommand(GetNearestObjectByTag("M2Q04CBRIDGEGRD"),ActionStartConversation(OBJECT_SELF));
    }
}
