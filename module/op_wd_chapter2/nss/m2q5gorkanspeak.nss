//::///////////////////////////////////////////////
//:: Entered
//:: m2q5GorkanSpeak
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 18, 2002
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    object oEntered = GetEnteringObject();
    object oGorkan = GetNearestObjectByTag("M2Q05CGORKAN");
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
    if (GetIsPC(oEntered) && GetIsObjectValid(oGorkan))
    {
        //Clear all actions to initiate new AI stream.
        AssignCommand(oGorkan, ClearAllActions());
        AssignCommand(oGorkan, SpeakOneLinerConversation());
        if(GetIsObjectValid(oPC))
        {
            AssignCommand(oGorkan, DetermineCombatRound(oPC));
        }

        DestroyObject(OBJECT_SELF,0.1);
    }
}
