//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName: q1g_ud_gilford
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gilords Heartbeat - Will do some worship animations but
    occaisionally will stroll around the room...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 14/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if (GetAILevel(OBJECT_SELF) != AI_LEVEL_VERY_LOW)
        {
            //If not in conversation and not in combat...
            if (IsInConversation(OBJECT_SELF) == FALSE && GetIsInCombat() == FALSE)
            {
                //if I am not marked as busy then need to pick an action
                if (GetLocalInt(OBJECT_SELF, "nBusy") != 1)
                {
                    //90% of the time - play Worship animation...
                    if (Random(10) + 1 < 10)
                    {
                        //Check to see if I am at the Altar...
                        if (GetDistanceToObject(GetWaypointByTag("wp_q1g_gilfordworship")) < 2.0)
                        {
                            ClearAllActions();
                            SetFacingPoint(GetPosition(GetObjectByTag("q1galtar")));
                            SetLocalInt(OBJECT_SELF, "nBusy", 1);
                            ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, 60.0);
                            SoundObjectPlay(GetObjectByTag("q1gchants"));
                            DelayCommand(60.0, SetLocalInt(OBJECT_SELF, "nBusy", 0));
                        }
                        //if not - move to the altar
                        else
                        {
                            SetLocalInt(OBJECT_SELF, "nBusy", 1);
                            ActionMoveToObject(GetObjectByTag("q1galtar"));
                            DelayCommand(20.0, SetLocalInt(OBJECT_SELF, "nBusy", 0));
                        }
                    }
                    //10% of the time walk around the room
                    else
                    {
                        SoundObjectStop(GetObjectByTag("q1gchants"));
                        SetLocalInt(OBJECT_SELF, "nBusy", 1);
                        int nWaypoint = Random(3) + 1;
                        object oTarget = GetWaypointByTag("wp_q1g_gilford" + IntToString(nWaypoint));
                        ActionMoveToObject(oTarget);
                        DelayCommand(10.0, ActionPlayAnimation(ANIMATION_LOOPING_LOOK_FAR, 1.0, 2.0));
                        DelayCommand(13.0, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 2.0));
                        DelayCommand(20.0, SetLocalInt(OBJECT_SELF, "nBusy", 0));
                    }

                }

            }
        }
    }


}


