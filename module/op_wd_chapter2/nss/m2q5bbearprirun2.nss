//::///////////////////////////////////////////////
//:: Conversation
//:: m2q5BBearPriRun2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The bugbear goes hostile and runs away.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 6, 2001
//:://////////////////////////////////////////////

void main()
{
    AdjustReputation(GetLastSpeaker(),OBJECT_SELF,-100);
    ActionMoveAwayFromObject(GetLastSpeaker());
}
