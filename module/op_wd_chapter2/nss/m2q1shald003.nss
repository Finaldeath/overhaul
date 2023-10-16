//::///////////////////////////////////////////////
//:: Conversation
//:: M2Q1SHALD003
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Shaldrissa leaves Port Llast.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 14, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_ShaldLeave",20);
    ActionMoveAwayFromObject(GetPCSpeaker(),TRUE);
    DelayCommand(5.0,DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}
