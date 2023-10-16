//::///////////////////////////////////////////////
//:: Name q7_ent_bandtrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    PCs should be able to hear bandits talking up
    ahead...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 9/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "x0_i0_walkway"
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) == TRUE && GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);

        object oBandit1 = GetObjectByTag("q7bandit1");
        object oBandit2 = GetObjectByTag("q7bandit2");
        object oBandit3 = GetObjectByTag("q7bandit3");

        AssignCommand(oBandit1, SpeakStringByStrRef(40264));
        DelayCommand(1.0, AssignCommand(oBandit3, SpeakStringByStrRef(40265)));
        DelayCommand(3.0, AssignCommand(oBandit1, SpeakStringByStrRef(40266)));
        DelayCommand(5.0, AssignCommand(oBandit3, SpeakStringByStrRef(40267)));
        DelayCommand(7.0, AssignCommand(oBandit3, WalkWayPoints()));
   }
}
