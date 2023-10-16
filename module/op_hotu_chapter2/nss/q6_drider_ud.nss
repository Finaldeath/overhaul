//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Drider assassin: jump away every few rounds
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "nw_i0_generic"

void Jump()
{
    object oWP = GetNearestObjectByTag("q6f_wp_assassin_jump", OBJECT_SELF, 3);
    effect eJump = EffectDisappearAppear(GetLocation(oWP));
    // heal now more than 5 times
    int nCount = GetLocalInt(OBJECT_SELF, "HEAL_COUNT");
    nCount++;
    SetLocalInt(OBJECT_SELF, "HEAL_COUNT", nCount);
    if(nCount <= 5)
    {
        effect eHeal = EffectHeal(30);
        DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, OBJECT_SELF));
    }
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eJump, OBJECT_SELF, 4.0);
    object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
    DelayCommand(4.1, DetermineCombatRound(oEnemy));
    SetLocalInt(OBJECT_SELF, "JUMP_COUNT_MAX", 0);
    SetLocalInt(OBJECT_SELF, "JUMP_COUNT", 0);
}

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {
        // jumps every few rounds
        int nCount = GetLocalInt(OBJECT_SELF, "JUMP_COUNT");
        int nCurrentMax = GetLocalInt(OBJECT_SELF, "JUMP_COUNT_MAX");
        nCount++;
        SetLocalInt(OBJECT_SELF, "JUMP_COUNT", nCount);
        if(nCurrentMax == 0)
        {
            nCurrentMax = Random(3) + 1;
            SetLocalInt(OBJECT_SELF, "JUMP_COUNT_MAX", nCurrentMax);
        }
        if(nCount == nCurrentMax) // already have a random time
            Jump();
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

}

