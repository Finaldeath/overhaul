//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: 2Q4_Mother_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make the NPC run away when they see a PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 4, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
#include "NW_I0_2Q4LUSKAN"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

    }
    else if(nUser == 1002) // PERCEIVE
    {
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
        if(GetIsObjectValid(oPC))
        {
            SpeakOneLinerConversation();
            ActionWait(1.0);
            MoveTo2Q4PlotPoint(1);
            ActionWait(1.0);
            ActionPlayAnimation(ANIMATION_LOOPING_TALK_PLEADING, 1.0, 9.0);
            DelayCommand(1.0, AssignCommand(OBJECT_SELF, SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT)));
            SetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT, FALSE);
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
