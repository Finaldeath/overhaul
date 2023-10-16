//::///////////////////////////////////////////////
//:: Tymofarrar custom HB
//:: q5_tymofarrar_ud
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 if an enemy is 3 rounds or more farther than 30.0m away -> jump somewhere else
*/

#include "nw_i0_generic"

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    if (nEvent == EVENT_HEARTBEAT) {
        if(!GetIsInCombat())
            return;
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        float fDistance = GetDistanceBetween(OBJECT_SELF, oPC);
        if(fDistance <= 15.0) // all is ok
            SetLocalInt(OBJECT_SELF, "Q5_TIME_ENEMY_FAR", 0); // init the count
        int nTimes = GetLocalInt(OBJECT_SELF, "Q5_TIME_ENEMY_FAR");
        if(nTimes == 3)
        {
            SetLocalInt(OBJECT_SELF, "Q5_TIME_ENEMY_FAR", 0); // init the count
            effect eJump = EffectDisappearAppear(GetLocation(oPC));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eJump, OBJECT_SELF, 3.0);

        }
        else
        {
            nTimes++;
            SetLocalInt(OBJECT_SELF, "Q5_TIME_ENEMY_FAR", nTimes);
        }

    } else if (nEvent == EVENT_PERCEIVE) {

    } else if (nEvent == EVENT_DIALOGUE) {

    } else if (nEvent == EVENT_DISTURBED) {

    } else if (nEvent == EVENT_ATTACKED) {

    } else if (nEvent == EVENT_DAMAGED) {

    } else if (nEvent == EVENT_END_COMBAT_ROUND) {

    } else if (nEvent == EVENT_SPELL_CAST_AT) {

    } else if (nEvent == 1007) { // death event
       object oPC = GetLocalObject(GetModule(), "X1_POLY_FROST_GIANT");
       if(GetHasEffect(EFFECT_TYPE_POLYMORPH, oPC))
       {
          effect ePoly = GetFirstEffect(oPC);
          while(GetIsEffectValid(ePoly))
          {
             RemoveEffect(oPC, ePoly);
             ePoly = GetNextEffect(oPC);
          }
       }
    }

}


