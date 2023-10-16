//::///////////////////////////////////////////////
//:: Default User Defined Event
//:: FileName: q2d_ud_drowlook1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 19/02
//:://////////////////////////////////////////////
#include "nw_i0_generic"

void SpawnReinforcements1();
void SpawnReinforcements2();
void SpawnReinforcements3();
void InsultPC(object oPC);

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

    }
    else if(nUser == 1002) // PERCEIVE
    {
        if (GetLocalInt(OBJECT_SELF, "nDoneOnce") == 1)
            return;
        object oPC = GetLastPerceived();
        if (GetIsPC(oPC) == TRUE)
        {
            SetLocalInt(OBJECT_SELF, "nDoneOnce", 1);
            //SendMessageToPC(GetFirstPC(), "PC PERCEIVED");
            object oArea = GetArea(OBJECT_SELF);
            SignalEvent(oArea, EventUserDefined(101));

            SetLocalInt(OBJECT_SELF, "nDoneOnce", 1);
            SpeakStringByStrRef(84098, TALKVOLUME_SHOUT);

            object oArcher1 = GetObjectByTag("q2d_archer1");
            object oArcher2 = GetObjectByTag("q2d_archer2");
            object oStairs = GetWaypointByTag("wp_q2d_StairsUp");

            AssignCommand(oArcher1, ActionMoveToObject(oStairs));
            AssignCommand(oArcher2, ActionMoveToObject(oStairs));

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




