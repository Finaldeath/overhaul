//::///////////////////////////////////////////////
//:: Conversation
//:: m2q1Albie001
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Albie leaves the Alliance Arms Inn.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 10, 2002
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetObjectByTag("M2Q1B2toM2Q1A");

    SetIsDestroyable(FALSE);
    ActionMoveToObject(oDoor,FALSE,1.9);
    ActionOpenDoor(oDoor);
    ActionDoCommand(AssignCommand(oDoor,DelayCommand(2.0,ActionCloseDoor(OBJECT_SELF))));
    CreateObject(OBJECT_TYPE_ITEM,"M2Q03IALBIEJOUR",GetLocation(GetWaypointByTag("WP_ALBIE2")));
    ActionJumpToObject(GetWaypointByTag("WP_ALBIE"));
    ActionDoCommand(DelayCommand(10.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(GetCurrentHitPoints(OBJECT_SELF)),OBJECT_SELF)));
    SetCommandable(FALSE);
}
