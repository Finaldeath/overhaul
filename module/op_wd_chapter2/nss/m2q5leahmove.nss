//::///////////////////////////////////////////////
//::
//:: Conversation
//::
//:: M2Q5LeahMove.NSS
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: Leah escapes to the farmhouse.
//::
//::
//::
//:://////////////////////////////////////////////
//::
//:: Created By: John
//:: Created On: September 25, 2001
//::
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(),"NW_G_M2Q5LeahRescue",10);
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M2Q05ILEAHRING"),GetLastSpeaker());
    ActionMoveAwayFromObject(GetLastSpeaker(),TRUE);
    DelayCommand(5.0,ClearAllActions());
    DelayCommand(5.0,ActionJumpToObject(GetWaypointByTag("WP_M2Q5LeahMove")));
    DelayCommand(5.0,SetFacing(GetFacing(GetWaypointByTag("WP_M2Q5LeahMove"))));
}
