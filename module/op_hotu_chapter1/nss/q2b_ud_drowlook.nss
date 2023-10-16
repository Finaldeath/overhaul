//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q2b_ud_drowlook
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the lookout spots a PC - he should run back
    into his room - shouting a warning and have all
    drow attack the PC...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 17/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

    }
    else if(nUser == 1002) // PERCEIVE
    {
        if (GetLocalInt(OBJECT_SELF, "nWarningGiven") == 1)
            return;
        object oPC = GetLastPerceived();
        if (GetIsPC(oPC) == TRUE)
        {
            if (GetLastPerceptionSeen() == TRUE)
            {
                SetLocalInt(OBJECT_SELF, "nWarningGiven", 1);
                location lTarget = GetLocation(GetWaypointByTag("wp_q2b_lookout1"));
                if (GetGender(oPC) == GENDER_MALE)
                    SpeakStringByStrRef(84082, TALKVOLUME_SHOUT);
                else
                    SpeakStringByStrRef(84083, TALKVOLUME_SHOUT);

                ActionMoveToLocation(lTarget, TRUE);

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

