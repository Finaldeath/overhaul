//::///////////////////////////////////////////////
//:: Conversation
//:: m2q1Peren001
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Peren leaves the Alliance Arms Inn.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 10, 2002
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetObjectByTag("M2Q1B2toM2Q1A");

    //ActionMoveToObject(oDoor);
    //ActionDoCommand(AssignCommand(oDoor,ActionOpenDoor(oDoor)));
    //ActionDoCommand(AssignCommand(oDoor,DelayCommand(2.0,ActionCloseDoor(OBJECT_SELF))));
    CreateItemOnObject("M2Q2ITJOURNPEREN");
    ActionJumpToObject(GetWaypointByTag("WP_PEREN"));
    ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_Moved",10));
    ActionDoCommand(DelayCommand(10.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(GetCurrentHitPoints(OBJECT_SELF) - 1),OBJECT_SELF)));
    ActionDoCommand(SetCommandable(TRUE));
    SetCommandable(FALSE);
}
