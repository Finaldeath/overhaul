//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: q3_ud_ginjured
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Injured goblin user defined events
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        int nCurr = GetCurrentHitPoints();
        int nMax = GetMaxHitPoints();
        int nDieValue = GetLocalInt(OBJECT_SELF, "OS_ANIMATION");
        if(nCurr!=nMax)
        {
            if(nDieValue == FALSE && !IsInConversation(OBJECT_SELF)
                && !GetIsObjectValid(GetAttemptedAttackTarget())
                && !GetIsObjectValid(GetAttemptedSpellTarget())            )
            {
                SetLocalInt(OBJECT_SELF, "OS_ANIMATION", TRUE);
                ClearAllActions();
                float fTime = HoursToSeconds(1);
                ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 1.0, fTime);
                DelayCommand(fTime, SetLocalInt(OBJECT_SELF, "OS_ANIMATION", FALSE));
            }
        }
        else if(nDieValue == FALSE)
        {
            ClearAllActions();
            SetLocalInt(OBJECT_SELF, "OS_ANIMATION", TRUE);
            ChangeToStandardFaction(OBJECT_SELF,STANDARD_FACTION_HOSTILE);
            DetermineCombatRound();
        }
    }
    else if(nUser == 1002) // PERCEIVE
    {
        object oPC = GetFirstPC();
        if(GetLastPerceived()==oPC)
        {
            SetLocalInt(OBJECT_SELF, "OS_ANIMATION", TRUE);
            ChangeToStandardFaction(OBJECT_SELF,STANDARD_FACTION_HOSTILE);
        }
    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {

    }
    else if(nUser == 1008) // DISTURBED
    {

    }
    else if(nUser = 301)// the shaman has healed the goblin
    {
        ClearAllActions();
        SetLocalInt(OBJECT_SELF, "OS_ANIMATION", TRUE);
        ChangeToStandardFaction(OBJECT_SELF,STANDARD_FACTION_HOSTILE);
        DetermineCombatRound();
    }

}

