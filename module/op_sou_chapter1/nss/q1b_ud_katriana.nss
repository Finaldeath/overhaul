//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q1b_ud_katriana
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

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
        if (GetAILevel(OBJECT_SELF) != AI_LEVEL_VERY_LOW)
        {
            if (IsInConversation(OBJECT_SELF) == FALSE && GetIsInCombat() == FALSE)
            {
                //if there are still some injured halflings
                if (GetLocalInt(OBJECT_SELF, "nAllHealed") == 0)
                {
                    //if I am not currently busy (i.e. moving to a new target)
                    if (GetLocalInt(OBJECT_SELF, "nBusy") != 1)
                    {
                        object oTarget = GetLocalObject(OBJECT_SELF, "oToCheckOn");
                        //If no target - pick a target.
                        if (oTarget == OBJECT_INVALID)
                        {
                            oTarget = GetObjectByTag("q1b_inj_half1");

                            if (GetLocalInt(oTarget, "nHealed") == 1)
                            {
                                oTarget = GetObjectByTag("q1b_inj_half2");
                                if (GetLocalInt(oTarget, "nHealed") == 1)
                                {
                                    oTarget = GetObjectByTag("q1b_inj_half3");
                                    if (GetLocalInt(oTarget, "nHealed") == 1)
                                    {
                                        SetLocalInt(OBJECT_SELF,"nAllHealed", 1);
                                        oTarget = OBJECT_INVALID;
                                    }
                                }
                            }
                        }
                        if (GetLocalInt(oTarget, "nHealed") == 1)
                        {
                            SetLocalObject(OBJECT_SELF, "oToCheckOn", OBJECT_INVALID);
                        }
                        else
                        {
                            // Move to Target (should do nothing the first time through after all are healed
                            //and do an animation
                            SetLocalInt(OBJECT_SELF, "nBusy", 1);
                            ActionMoveToObject(oTarget);
                            ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 3.0);
                            DelayCommand(10.0, SetLocalInt(OBJECT_SELF, "nBusy", 0));
                            //Set next target
                            if (GetTag(oTarget) == "q1b_inj_half1")
                            {
                                oTarget = GetObjectByTag("q1b_inj_half2");
                                if (GetLocalInt(oTarget, "nHealed") == 1)
                                    oTarget = GetObjectByTag("q1b_inj_half3");
                                SetLocalObject(OBJECT_SELF, "oToCheckOn", oTarget);
                            }
                            else if (GetTag(oTarget) == "q1b_inj_half2")
                            {
                                oTarget = GetObjectByTag("q1b_inj_half3");
                                if (GetLocalInt(oTarget, "nHealed") == 1)
                                    oTarget = GetObjectByTag("q1b_inj_half1");
                                SetLocalObject(OBJECT_SELF, "oToCheckOn", oTarget);
                            }
                            else if (GetTag(oTarget) == "q1b_inj_half3")
                            {
                                oTarget = GetObjectByTag("q1b_inj_half1");
                                if (GetLocalInt(oTarget, "nHealed") == 1)
                                    oTarget = GetObjectByTag("q1b_inj_half2");
                                SetLocalObject(OBJECT_SELF, "oToCheckOn", oTarget);
                            }
                        }
                    }
                }
                //Move to post and keep still
                else if (GetLocalInt(OBJECT_SELF, "nAllHealed") == 1)
                {
                    ActionMoveToObject(GetWaypointByTag("wp_q1bkatpost"));
                    SetLocalInt(OBJECT_SELF, "nAllHealed", 2);
                }
            }


        }

    }
}

