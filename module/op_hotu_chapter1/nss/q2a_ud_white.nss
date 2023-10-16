//::///////////////////////////////////////////////
//:: Default User Defined Event
//:: FileName: q2a_ud_white
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
During the Attack on the Yawning Portal - White will
go around healing any injured commoners she finds...
Afterwards, she will raise any dead ones she finds...
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Jan 9/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

    /* Brent Fix July 2003
       Whenever doing any heartbeat scripting, make sure you are not interrupting.
       */
        if (GetIsInCombat() == TRUE || IsInConversation(OBJECT_SELF) == TRUE)
            return;

        //If we are down in the well room - don't do anything else (to prevent her running back upstairs)
        object oWellRoom = GetArea(OBJECT_SELF);
        if (GetTag(oWellRoom) == "q2awellroom")
        {
            object oWellPost = GetWaypointByTag("wp_q2awell_thesta");
            if (GetDistanceToObject(oWellPost) > 4.0)
            {
                ClearAllActions(TRUE);
                ActionMoveToObject(oWellPost);
            }
            return;
        }
        //during the attack - heal people
        if (GetLocalInt(GetModule(), "X2_ypattack") > 0 && GetLocalInt(GetModule(), "X2_ypattack") < 2)
        {//then attack is on...
            //if not already healing someone then...
            if (GetLocalInt(OBJECT_SELF, "nBusy") == 0)
            {
                //check to see if anyone is hurt, but not dead
                if (GetLocalInt(GetModule(), "X2_q2a_graybanD") != 1 && GetLocalInt(GetModule(), "X2_q2a_graybanH") == 1)
                {
                    SetLocalInt(OBJECT_SELF, "nBusy", 1);
                    SetLocalObject(OBJECT_SELF, "oTarget", GetObjectByTag("q2a_grayban"));
                    ActionMoveToObject(GetObjectByTag("q2a_grayban"), TRUE);
                }
                else if (GetLocalInt(GetModule(), "X2_cut1_glimD") != 1 && GetLocalInt(GetModule(), "X2_cut1_glimH") == 1)
                {
                    SetLocalInt(OBJECT_SELF, "nBusy", 1);
                    SetLocalObject(OBJECT_SELF, "oTarget", GetObjectByTag("cut1_glim"));
                    ActionMoveToObject(GetObjectByTag("cut1_glim"), TRUE);
                }
                else if (GetLocalInt(GetModule(), "X2_cut1_lafontaineD") != 1 && GetLocalInt(GetModule(), "X2_cut1_lafontaineH") == 1)
                {
                    SetLocalInt(OBJECT_SELF, "nBusy", 1);
                    SetLocalObject(OBJECT_SELF, "oTarget", GetObjectByTag("cut1_lafontaine"));
                    ActionMoveToObject(GetObjectByTag("cut1_lafontaine"), TRUE);
                }
                else if (GetLocalInt(GetModule(), "X2_q2amhaereD") != 1 && GetLocalInt(GetModule(), "X2_q2amhaereH") == 1 )
                {
                    SetLocalInt(OBJECT_SELF, "nBusy", 1);
                    SetLocalObject(OBJECT_SELF, "oTarget", GetObjectByTag("q2amhaere"));
                    ActionMoveToObject(GetObjectByTag("q2amhaere"), TRUE);
                }
                else if (GetLocalInt(GetModule(), "X2_cut1_parleyD") != 1 && GetLocalInt(GetModule(), "X2_cut1_parleyH") == 1)
                {
                    SetLocalInt(OBJECT_SELF, "nBusy", 1);
                    SetLocalObject(OBJECT_SELF, "oTarget", GetObjectByTag("cut1_parley"));
                    ActionMoveToObject(GetObjectByTag("cut1_parley"), TRUE);
                }

                else
                {
                    ActionMoveToObject(GetWaypointByTag("wp_q2awhite_post"), TRUE);
                }
            }
            //else we are busy - so move to target and heal him/her
            else
            {
                if (GetDistanceToObject(GetLocalObject(OBJECT_SELF, "oTarget")) < 20.0)
                {
                    if(GetLocalInt(GetModule(), "X2_" + GetTag(GetLocalObject(OBJECT_SELF, "oTarget")) + "DEAD") != 1)
                    {
                        ActionCastSpellAtObject(SPELL_CURE_CRITICAL_WOUNDS, GetLocalObject(OBJECT_SELF, "oTarget"), METAMAGIC_ANY, TRUE);
                    }
                    SetLocalInt(GetModule(), "X2_" + GetTag(GetLocalObject(OBJECT_SELF, "oTarget")) + "H", 0);
                    SetLocalInt(OBJECT_SELF, "nBusy", 0);
                    SetLocalObject(OBJECT_SELF, "oTarget", OBJECT_INVALID);
                }
                else
                {
                    ActionMoveToObject(GetLocalObject(OBJECT_SELF, "oTarget"), TRUE);
                }
            }
        }
        //after the attack - resurect people
        else if (GetLocalInt(GetModule(), "X2_ypattack") > 1 && GetLocalInt(GetModule(), "X2_ypattack") < 4)
        {//then attack is on...
            //if not already rezzing someone then...
            if (GetLocalInt(OBJECT_SELF, "nBusy") == 0)
            {
                //check to see if anyone is dead
                if (GetLocalInt(GetModule(), "X2_q2a_graybanD") == 1)
                {
                    SetLocalInt(OBJECT_SELF, "nBusy", 1);
                    SetLocalObject(OBJECT_SELF, "oTarget", GetObjectByTag("q2a_grayban"));
                    ActionMoveToObject(GetObjectByTag("q2a_grayban"), TRUE);
                }
                else if (GetLocalInt(GetModule(), "X2_cut1_glimD") == 1)
                {
                    SetLocalInt(OBJECT_SELF, "nBusy", 1);
                    SetLocalObject(OBJECT_SELF, "oTarget", GetObjectByTag("cut1_glim"));
                    ActionMoveToObject(GetObjectByTag("cut1_glim"), TRUE);
                }
                else if (GetLocalInt(GetModule(), "X2_cut1_lafontaineD") == 1)
                {
                    SetLocalInt(OBJECT_SELF, "nBusy", 1);
                    SetLocalObject(OBJECT_SELF, "oTarget", GetObjectByTag("cut1_lafontaine"));
                    ActionMoveToObject(GetObjectByTag("cut1_lafontaine"), TRUE);
                }
                else if (GetLocalInt(GetModule(), "X2_q2amhaereD") == 1)
                {
                    SetLocalInt(OBJECT_SELF, "nBusy", 1);
                    SetLocalObject(OBJECT_SELF, "oTarget", GetObjectByTag("q2amhaere"));
                    ActionMoveToObject(GetObjectByTag("q2amhaere"), TRUE);
                }
                else if (GetLocalInt(GetModule(), "X2_cut1_parleyD") == 1)
                {
                    SetLocalInt(OBJECT_SELF, "nBusy", 1);
                    SetLocalObject(OBJECT_SELF, "oTarget", GetObjectByTag("cut1_parley"));
                    ActionMoveToObject(GetObjectByTag("cut1_parley"), TRUE);
                }
                // * Move White Thesta to the next level
                // * if she has no one else to raise
                // * bring her store with her
                else
                {
                    object oWellRoom = GetWaypointByTag("wp_q2awell_thesta");
                    ActionForceMoveToObject(oWellRoom, TRUE, 1.0, 10.0);
                }
            }
            //else we are busy - so move to target and raise him/her
            else
            {
                if (GetDistanceToObject(GetLocalObject(OBJECT_SELF, "oTarget")) < 5.0)
                {
                    ActionCastSpellAtObject(SPELL_RESURRECTION, GetLocalObject(OBJECT_SELF, "oTarget"), METAMAGIC_ANY, TRUE);
                    SetLocalInt(GetModule(), "X2_" + GetTag(GetLocalObject(OBJECT_SELF, "oTarget")) + "D", 0);
                    SetLocalInt(OBJECT_SELF, "nBusy", 0);
                    SetLocalObject(OBJECT_SELF, "oTarget", OBJECT_INVALID);
                }
                else
                {
                    ActionMoveToObject(GetLocalObject(OBJECT_SELF, "oTarget"), TRUE);
                }
            }


        }

    }

}


