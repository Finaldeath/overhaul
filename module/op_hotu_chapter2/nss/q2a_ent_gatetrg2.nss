//::///////////////////////////////////////////////
//:: Name q2a_ent_gatetrig    //OUTER GATE
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 On enter of the inner gates trigger - attackers
 will bash the gate...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 28/03
//:://////////////////////////////////////////////

void main()
{
    //if the gate is not there - do nothing
    object oGate = GetObjectByTag("q2ainnergate");
    if (GetIsObjectValid(oGate) == FALSE)
        return;

    object oAttacker = GetEnteringObject();
    if (GetLocalInt(oAttacker, "nRetreat") == 1)
        return;

    string szTag = GetTag(oAttacker);
    if (szTag == "q2a_bat1_duer1" || szTag == "x2_q2drowwarrio2" || GetStringLeft(szTag, 8) == "q2a_bat1")
    {
        SetLocalInt(oAttacker, "nInnerGateAttack", 1);
        AssignCommand(oAttacker, ClearAllActions(TRUE));
        AssignCommand(oAttacker, DoDoorAction(oGate, DOOR_ACTION_BASH));
        DelayCommand(6.0, SignalEvent(oAttacker, EventUserDefined(5001)));//Bash Gate
    }

}

