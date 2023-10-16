//::///////////////////////////////////////////////
//:: Listen check for ambush
//:: q2_trig_listen
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On-enter to trigger: player is given a warning if listen skill is high enough
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 6/2/2003
//:://////////////////////////////////////////////

#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;

    if (GetIsPlayerCharacter(oPC) == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

        int nSkillRank = GetSkillRank(SKILL_LISTEN, oPC);
        if(nSkillRank >= 3 || GetLevelByClass(CLASS_TYPE_RANGER, oPC ) > 0 || GetLevelByClass(CLASS_TYPE_DRUID, oPC ) > 0 || GetLevelByClass(CLASS_TYPE_BARBARIAN, oPC ) > 0)
        {
            AssignCommand(oPC, ClearAllActions());
            FloatingTextStrRefOnCreature(40296, oPC);
        }
        /*object oKobold1 = GetNearestObjectByTag("Q2_KOBOLD_AMBUSH1");
        object oKobold2 = GetNearestObjectByTag("Q2_KOBOLD_AMBUSH2");
        // using string and not dialog to prevent kobolds from getting closer to each other
        DelayCommand(1.0, AssignCommand(oKobold1, SpeakString("Is Gnoll!")));
        DelayCommand(3.0, AssignCommand(oKobold2, SpeakString("Is not Gnoll!")));
        DelayCommand(5.0, AssignCommand(oKobold1, SpeakString("Is too! Kill it! Kill it!")));*/
    }
}
