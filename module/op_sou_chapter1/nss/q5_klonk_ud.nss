//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 Place in the OnUserDefinedEvent handler for
 the appropriate creature, then edit that
 creature's OnSpawn script to generate any of
 the desired events.
*/


void main()
{
    int nEvent = GetUserDefinedEventNumber();

    if (nEvent == EVENT_HEARTBEAT) {

    } else if (nEvent == EVENT_PERCEIVE) {

    } else if (nEvent == EVENT_DIALOGUE) {

    } else if (nEvent == EVENT_DISTURBED) {

    } else if (nEvent == EVENT_ATTACKED) {

    } else if (nEvent == EVENT_DAMAGED) {
        int nHP = GetCurrentHitPoints();
        if(nHP < 25)
        {
            int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
            if(nDoOnce == 1)
                return;
            SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

            object oPC = GetLastDamager();
            object oWP = GetWaypointByTag("Q5A_WP_OX3");
            ClearAllActions();
            ActionMoveToObject(oWP, TRUE);
            ActionDoCommand(SetFacingPoint(GetPosition(oPC)));
            SpeakStringByStrRef(40272);
            ActionEquipMostDamagingRanged(oPC);
            ActionAttack(oPC);
            //DetermineCombatRound(oPC);
            DelayCommand(0.5, SetCommandable(FALSE));
            DelayCommand(7.0, SetCommandable(TRUE));
        }

    } else if (nEvent == EVENT_END_COMBAT_ROUND) {

    } else if (nEvent == EVENT_SPELL_CAST_AT) {

    }
    else if(nEvent == 101)
    {
        if (GetIsDead(OBJECT_SELF))
            return;
        SpeakStringByStrRef(40390);
        object oWP = GetWaypointByTag("Q5A_WP_OX3");
        ClearAllActions();
        ActionMoveToObject(oWP, TRUE);
        SetCommandable(FALSE);
        DelayCommand(9.0, SetCommandable(TRUE));
    }

}


