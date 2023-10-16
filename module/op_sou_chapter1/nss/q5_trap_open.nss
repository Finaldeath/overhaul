//::///////////////////////////////////////////////
//:: Portcullis trap, on-open event for the chest
//:: q5_trap_open
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     1. Close all portcullises
     2. Open all stone doors.
     3. Send event to triggers. (this event will cause the trigger to tell the kobolds to come and attack
     4. Move over all kobolds that are not included in the encounters.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 13/2/2003
//:://////////////////////////////////////////////

#include "nw_i0_generic"
#include "nw_i0_tool"

void HandleTrigger(object oTrigger, object oWP, object oPC)
{
    SetLocalObject(oTrigger, "Q5_WP_TARGET", oWP);
    SetLocalObject(oTrigger, "Q5_PC_TARGET", oPC);
    SignalEvent(oTrigger, EventUserDefined(101));
}

void Open(object oDoor)
{
    AssignCommand(oDoor, SetLocked(oDoor, FALSE));
    AssignCommand(oDoor, ActionOpenDoor(oDoor));
}

void Close(object oDoor)
{
    AssignCommand(oDoor, ActionCloseDoor(oDoor));
    AssignCommand(oDoor, SetLocked(oDoor, TRUE));
}

void MoveAndAttack(object oKobold, object oWP, object oPC)
{
    AssignCommand(oKobold, ClearAllActions());
    AssignCommand(oKobold, ActionMoveToObject(oWP, TRUE));
    AssignCommand(oKobold, ActionDoCommand(DetermineCombatRound(oPC)));
}

void main()
{
    object oPC = GetLastOpenedBy();

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oWP1 = GetWaypointByTag("Q5_WP_ATTACK1");
    object oWP2 = GetWaypointByTag("Q5_WP_ATTACK2");
    object oWP3 = GetWaypointByTag("Q5_WP_ATTACK3");
    object oWP4 = GetWaypointByTag("Q5_WP_ATTACK4");

    object oTrigger1 = GetNearestObjectByTag("Q5_TRIGGER_PORTCULLIS_TRAP1");
    object oTrigger2 = GetNearestObjectByTag("Q5_TRIGGER_PORTCULLIS_TRAP2");
    object oTrigger3 = GetNearestObjectByTag("Q5_TRIGGER_PORTCULLIS_TRAP3");
    object oTrigger4 = GetNearestObjectByTag("Q5_TRIGGER_PORTCULLIS_TRAP4");

    HandleTrigger(oTrigger1, oWP1, oPC);
    HandleTrigger(oTrigger2, oWP2, oPC);
    HandleTrigger(oTrigger3, oWP3, oPC);
    HandleTrigger(oTrigger4, oWP4, oPC);

    object oPort1 = GetNearestObjectByTag("Q5_PORTCULLIS1", OBJECT_SELF);
    object oPort2 = GetNearestObjectByTag("Q5_PORTCULLIS2", OBJECT_SELF);
    object oPort3 = GetNearestObjectByTag("Q5_PORTCULLIS3", OBJECT_SELF);
    object oPort4 = GetNearestObjectByTag("Q5_PORTCULLIS4", OBJECT_SELF);

    DelayCommand(1.0, Close(oPort1));
    DelayCommand(1.5, Close(oPort2));
    DelayCommand(2.0, Close(oPort3));
    DelayCommand(2.5, Close(oPort4));

    /*if(AutoDC(DC_HARD, SKILL_TUMBLE, oPC) == TRUE)
    {
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_SIDE));
        object oWP = GetWaypointByTag("Q5A_WP_TUMBLE");
        DelayCommand(1.0, AssignCommand(oPC, JumpToObject(oWP)));
        DelayCommand(1.0, SendMessageToPC(oPC, "You have managed to jump to the other side of the falling portcullis."));
    }*/

    object oStone1 = GetNearestObjectByTag("Q5_AUTO_DOOR1", OBJECT_SELF);
    object oStone2 = GetNearestObjectByTag("Q5_AUTO_DOOR2", OBJECT_SELF);
    object oStone3 = GetNearestObjectByTag("Q5_AUTO_DOOR3", OBJECT_SELF);
    object oStone4 = GetNearestObjectByTag("Q5_AUTO_DOOR4", OBJECT_SELF);

    Open(oStone1);
    Open(oStone2);
    Open(oStone3);
    Open(oStone4);

    object oSorcerer = GetNearestObjectByTag("Q5_KOBOLD_SORCERER");
    object oAdept = GetNearestObjectByTag("Q5_KOBOLD_ADEPT");
    object oSer1 = GetNearestObjectByTag("Q5_KOBOLD_SER1");
    object oSer2 = GetNearestObjectByTag("Q5_KOBOLD_SER2");

    MoveAndAttack(oSer2, oWP4, oPC);
    MoveAndAttack(oAdept, oWP1, oPC);
    MoveAndAttack(oSer1, oWP2, oPC);
    MoveAndAttack(oSorcerer, oWP3, oPC);
}
