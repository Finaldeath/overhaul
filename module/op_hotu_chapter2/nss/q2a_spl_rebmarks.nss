//::///////////////////////////////////////////////
//:: Default: On Spell Cast At
//:: q2_onspellcastat
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This determines if the spell just cast at the
    target is harmful or not.

    SEP27: Trying to add a little Area-of-effect IQ
    When affected will move towards the originator
    of the area effect.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 27/03
//:://////////////////////////////////////////////



void main()
{

    //Do nothing if we are already in combat since the end of combat round script should fire
    if (GetIsInCombat() == TRUE)
        return;



    object oTarget = GetLastSpellCaster();
    if(GetLastSpellHarmful())
    {
        //if the target is dead - pick the next nearest target
        if (GetIsDead(oTarget) == TRUE)
            oTarget = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, 1, CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);

        ClearAllActions(TRUE);
        //if the front gate isn't down yet - do nothing unless we were damaged
        //by an outsider - this should prevent us rushing the gate when hit by arrows
        if (GetLocalInt(GetModule(), "X2_Q2ABattle1_Gate1Open") == 0)
        {
            if (GetRacialType(oTarget) != RACIAL_TYPE_OUTSIDER)
                return;
        }

        //Attack the target
        ActionAttack(oTarget);
    }





}

