//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q1a_ud_kobold
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When the first cutscene is completed - the kobolds
    will try and flee
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 4/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

       if (GetLocalInt(GetModule(), "X1_CUT1RUNNING") ==  2)
       {
            object oDoor = GetObjectByTag("q1a_door_int");
            if (GetLocalInt(GetArea(OBJECT_SELF), "nPCONSTAIRS") != 1)
            {
                //1/2 chance of leaving each turn
                if (Random(2) + 1 == 2)
                {
                    ClearAllActions(TRUE);
                    ActionMoveToObject(oDoor, TRUE);
                    SetCommandable(FALSE);
                }

            }
            else
            {
                //1/4 chance of leaving each turn
                if (Random(4) + 1 == 4)
                {
                    ClearAllActions(TRUE);
                    ActionMoveToObject(oDoor, TRUE);
                    SetCommandable(FALSE);
                }
            }

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

