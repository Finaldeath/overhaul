//:://////////////////////////////////////////////////
//:: q5_kbld_ent_per
/*
  Kobolds call for help at entrance.

   kobolds will open wolf den whenever they spot a pc
 */
//:://////////////////////////////////////////////////
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 13/2/2003
//:://////////////////////////////////////////////

#include "nw_i0_generic"

void BringWolves(object oPC)
{
    // make sure the call for help is done only once
    int nDoOnce = GetLocalInt(GetArea(OBJECT_SELF), "DO_WOLVES_ONCE");
    if(nDoOnce == 1)
      return;
    SetLocalInt(GetArea(OBJECT_SELF), "DO_WOLVES_ONCE", 1);

    int n = 1;
    object oWolf = GetNearestObjectByTag("NW_WOLF", OBJECT_SELF, n);
    while(oWolf != OBJECT_INVALID)
    {
        n++;
        if(GetIsInCombat(oWolf))
            continue;
        AssignCommand(oWolf, ClearAllActions());
        AssignCommand(oWolf, ActionAttack(oPC));
        oWolf = GetNearestObjectByTag("NW_WOLF", OBJECT_SELF, n);
    }
    object oKobold1 = GetNearestObjectByTag("Q5_KOBOLD_WOLF1");
    object oKobold2 = GetNearestObjectByTag("Q5_KOBOLD_WOLF2");

    DelayCommand(7.0, ChangeToStandardFaction(oKobold1, STANDARD_FACTION_HOSTILE));
    DelayCommand(7.0, ChangeToStandardFaction(oKobold2, STANDARD_FACTION_HOSTILE));
    DelayCommand(7.0, AssignCommand(oKobold1, DetermineCombatRound()));
    DelayCommand(7.0, AssignCommand(oKobold2, DetermineCombatRound()));
}


void main()
{
    object oPercep = GetLastPerceived();
    int bSeen = GetLastPerceptionSeen();

    if (GetIsPC(oPercep) && bSeen)
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
        if(nDoOnce == 1)
             return;
        SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

        SetIsTemporaryEnemy(oPercep);

        object oDoor = GetNearestObjectByTag("Q5A_WOLF_DOOR");
        ActionMoveToObject(oDoor, TRUE);
        if(!GetIsOpen(oDoor))
            ActionOpenDoor(oDoor);

        if(GetTag(OBJECT_SELF) == "Q5_KOBOLD_WOLF1")
            SpeakStringByStrRef(40273);
        else
            SpeakStringByStrRef(40274);

        ActionDoCommand(BringWolves(oPercep));
    }
}




