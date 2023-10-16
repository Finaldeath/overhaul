//::///////////////////////////////////////////////
//:: Name  q2dn_userdef
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    User Defined Events for Undermountain level 3 North
    - if the alarm has sounded - turn on the alarm sound,
    move Drow into Defensive positions
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 26/03
//:://////////////////////////////////////////////

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if (nEvent == 101)
    {
        if (GetLocalInt(OBJECT_SELF, "nAlarmHasBeenSounded") == 1)
            return;
        SetLocalInt(OBJECT_SELF, "nAlarmHasBeenSounded", 1);

        object oAlarmSound = GetObjectByTag("q2dalarmsound");
        SoundObjectPlay(oAlarmSound);
        DelayCommand(30.0, SoundObjectStop(oAlarmSound));

        object oAlarmTarget = GetObjectByTag("q2dn_drowcamp_alarm1");

        object oArchTarget1 = GetObjectByTag("wp_q2dn_alarm_marksman1");
        object oArchTarget2 = GetObjectByTag("wp_q2dn_alarm_marksman2");
        object oArchTarget3 = GetObjectByTag("wp_q2dn_alarm_marksman3");
        object oArchTarget4 = GetObjectByTag("wp_q2dn_alarm_marksman4");
        object oWarTarget1 = GetObjectByTag("wp_q2dn_alarm_warrior1");
        object oWarTarget2 = GetObjectByTag("wp_q2dn_alarm_warrior2");

        object oArcher1 = GetNearestObjectByTag("x2_q2drowarcher2", oAlarmTarget, 1);
        object oArcher2 = GetNearestObjectByTag("x2_q2drowarcher2", oAlarmTarget, 2);
        object oArcher3 = GetNearestObjectByTag("x2_q2drowarcher2", oAlarmTarget, 3);
        object oArcher4 = GetNearestObjectByTag("x2_q2drowwiz2", oAlarmTarget, 4);
        object oWar1 = GetNearestObjectByTag("x2_q2drowwar1", oAlarmTarget);
        object oWar2 = GetNearestObjectByTag("x2_q2drowwar2", oAlarmTarget);

        AssignCommand(oArcher1, ActionMoveToObject(oArchTarget1, TRUE));
        AssignCommand(oArcher2, ActionMoveToObject(oArchTarget2, TRUE));
        AssignCommand(oArcher3, ActionMoveToObject(oArchTarget3, TRUE));
        AssignCommand(oArcher4, ActionMoveToObject(oArchTarget4, TRUE));
        AssignCommand(oWar1, ActionMoveToObject(oWarTarget1, TRUE));
        AssignCommand(oWar2, ActionMoveToObject(oWarTarget2, TRUE));

    }
}
