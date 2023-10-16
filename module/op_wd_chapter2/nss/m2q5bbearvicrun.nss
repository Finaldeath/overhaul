//::///////////////////////////////////////////////
//:: Conversation
//:: m2q5BBearVicRun
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The bugbear runs away.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 6, 2001
//:://////////////////////////////////////////////

void main()
{
    ActionMoveAwayFromObject(GetPCSpeaker(),TRUE);
    DelayCommand(5.0,DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}
