//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    userdefined in script for the cutscene creatures
    Makes them shout extra when they are attacked, to
    abort the cutscene.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

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

    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {
        SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
        // * v1.12: Made it so that this shout should make them hostile to all
        // * players in the same party of the attacker
        if (GetLocalInt(OBJECT_SELF, "NW_L_HOSTILE_ONCE") == 0)
        {
            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
            if (GetIsObjectValid(oPC) == TRUE)
            {
                AdjustReputation(oPC, OBJECT_SELF, -100);
            }
         SetLocalInt(OBJECT_SELF, "NW_L_HOSTILE_ONCE", 1);
        }
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

