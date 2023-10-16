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
#include "nw_i0_plot"
void main()
{
    int nUser = GetUserDefinedEventNumber();

/*    if(nUser == 1001) //HEARTBEAT
    {

    }
    else*/ if(nUser == 1002) // PERCEIVE
    {
//        SpeakString("This is my perceive event.");
        if (GetLocalInt(OBJECT_SELF, "NW_L_DOONCE_A") == 0)
        {
            object oPC  = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
            if (GetIsObjectValid(oPC))
            {
//                SpeakString("I see a pc.");
                if(GetDistanceToObject(oPC) < 20.0)
                {
//                     SpeakString("The PC is near.");
                    SetLocalInt(OBJECT_SELF, "NW_L_DOONCE_A",1);
                    ActionStartConversation(oPC);
//                    object oWay = GetObjectByTag("WP_M4Q1ASoldier_01");
//                    DelayCommand(1.0,ActionMoveToObject(oWay,TRUE));
                    DelayCommand(1.0,EscapeArea());
                 }
            }
        }
    }
/*    else if(nUser == 1003) // END OF COMBAT
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

    }*/

}

