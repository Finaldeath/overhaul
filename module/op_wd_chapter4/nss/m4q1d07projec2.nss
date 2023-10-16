//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        object oPC=GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC);
        if(GetIsEnemy(OBJECT_SELF,oPC))
        {
            SetLocalInt(OBJECT_SELF,"NW_L_M4Q01TALK_PROJECTION",1);
            //ExecuteScript("NW_D2_ATTONEND", OBJECT_SELF);
            AdjustReputation(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), OBJECT_SELF, -100);
            AssignCommand(GetNearestCreature(CREATURE_TYPE_REPUTATION,REPUTATION_TYPE_FRIEND), DetermineCombatRound());
            AssignCommand(GetNearestCreature(CREATURE_TYPE_REPUTATION,REPUTATION_TYPE_FRIEND,OBJECT_SELF,2), DetermineCombatRound());
            AssignCommand(GetNearestCreature(CREATURE_TYPE_REPUTATION,REPUTATION_TYPE_FRIEND,OBJECT_SELF,3), DetermineCombatRound());
            AssignCommand(GetNearestCreature(CREATURE_TYPE_REPUTATION,REPUTATION_TYPE_FRIEND,OBJECT_SELF,4), DetermineCombatRound());
            SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);
            effect eVis = EffectVisualEffect(VFX_IMP_DIVINE_STRIKE_FIRE);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);
            DestroyObject(OBJECT_SELF, 1.0);
        }
    }
    else if(nUser == 1002) // PERCEIVE
    {
        if (GetLocalInt(OBJECT_SELF, "NW_L_DOONCE_A") == 0)
        {
            object oPC  = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
            if (GetIsObjectValid(oPC) && GetDistanceToObject(oPC) < 20.0)
            {
                SetLocalInt(OBJECT_SELF, "NW_L_DOONCE_A",1);
//                ActionStartConversation(oPC); TRIGGER DOES THIS NOW May 2002
            }
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

}

