//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kobold slave user defined events
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

        object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE);
        if(GetDistanceBetween(OBJECT_SELF, oCreature) < 5.0
            && GetLocalInt(OBJECT_SELF, "RUNNING") == 0)
        {
            ClearAllActions();
            if(GetLocalInt(GetModule(), "x2_plot_beholders_out") == 1)
            {
                PlayAnimation(ANIMATION_FIREFORGET_GREETING);
            }

            SetLocalInt(OBJECT_SELF, "RUNNING", 1);
            object oWP = GetNearestObjectByTag("X2_WP_BEHOLDER_TUNNEL", OBJECT_SELF, 2);
            ActionMoveToObject(oWP, TRUE, 1.0);
            ActionDoCommand(SetLocalInt(OBJECT_SELF, "RUNNING", 0));
            SpeakOneLinerConversation("q5v_slave_scr");
        }
        else if(GetLocalInt(OBJECT_SELF, "RUNNING") == 0)
        {
            int nRand = Random(4);
            int nAnim;
            if(nRand == 0) nAnim = ANIMATION_LOOPING_LOOK_FAR;
            else if(nRand == 1) nAnim = ANIMATION_LOOPING_LISTEN;
            else if(nRand == 2) nAnim = ANIMATION_LOOPING_PAUSE_TIRED;
            else nAnim = ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD;

            PlayAnimation(nAnim);
        }





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

