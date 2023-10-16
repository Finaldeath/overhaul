//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_demon
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will have another creature spawn in when
     this one dies.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 19, 2003
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
        if(Random(100) < 35)
        {
            SpeakOneLinerConversation("");
        }
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
        object oPortal;

        //if(Random(100) > 50)
        //{
            oPortal = GetNearestObjectByTag("hx_demon_portal", OBJECT_SELF, 1);
       // }
        //else
       // {
        //    oPortal = GetNearestObjectByTag("hx_demon_portal", OBJECT_SELF, 2);
       // }

        SignalEvent(oPortal, EventUserDefined(4444));

    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

