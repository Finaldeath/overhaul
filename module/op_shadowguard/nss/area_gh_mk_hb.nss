void main()
{
    //Only worry about PCs in the area.
    object oPC = GetFirstPC();
    object oArea = GetArea(oPC);
    if (oArea == OBJECT_SELF)
    {
        //Check to see if the Crimson Prophet cutscene has started but is not
        //yet finished.
        int bCP_Started = GetLocalInt(OBJECT_SELF, "bCP_CutsceneStarted");
        int bCP_Complete = GetLocalInt(OBJECT_SELF, "bCP_CutsceneComplete");
        if (bCP_Started == TRUE &&
            bCP_Complete == FALSE)
        {
            //If they're not in conversation, they bloody well should be.
            int bInConv = IsInConversation(oPC);
            if (bInConv == FALSE)
            {
                //Jump them back to their designated waypoint
                object oWP = GetNearestObjectByTag("WP_CUTSCENE", oPC);

                //Launch the conversation
                AssignCommand(oPC, ActionStartConversation(oPC, "sc_st_0_cp", TRUE, FALSE));

                //Make sure they're facing the right direction
                AssignCommand(oPC, SetFacing(GetFacing(oWP)));
            }
        }

        //Return any guards to their posts.
        object oGuard1 = GetNearestObjectByTag("CT_COMM_SH_GHGD1", oPC);
        object oWP_Guard1 = GetWaypointByTag("WP_MARKETGUARD1");
        if (GetDistanceBetween(oGuard1, oWP_Guard1) > 1.0 ||
            GetFacing(oGuard1) != GetFacing(oWP_Guard1))
        {
            if (GetIsInCombat(oGuard1) == FALSE &&
                IsInConversation(oGuard1) == FALSE)
            {
                AssignCommand(oGuard1, ActionMoveToObject(oWP_Guard1, FALSE, 1.0));
                AssignCommand(oGuard1, ActionDoCommand(SetFacing(GetFacing(oWP_Guard1))));
            }
        }

        object oGuard2 = GetNearestObjectByTag("CT_COMM_SH_GHGD2", oPC);
        object oWP_Guard2 = GetWaypointByTag("WP_MARKETGUARD2");
        if (GetDistanceBetween(oGuard2, oWP_Guard2) > 1.0 ||
            GetFacing(oGuard2) != GetFacing(oWP_Guard2))
        {
            if (GetIsInCombat(oGuard2) == FALSE &&
                IsInConversation(oGuard2) == FALSE)
            {
                AssignCommand(oGuard2, ActionMoveToObject(oWP_Guard2, FALSE, 1.0));
                AssignCommand(oGuard2, ActionDoCommand(SetFacing(GetFacing(oWP_Guard2))));
            }
        }

        object oGanolin = GetNearestObjectByTag("CT_UNIQ_SH_GANO", oPC);
        object oWP_Ganolin = GetWaypointByTag("WP_OFFICERGANOLIN");
        if (GetDistanceBetween(oGanolin, oWP_Ganolin) > 1.0 ||
            GetFacing(oGanolin) != GetFacing(oWP_Ganolin))
        {
            if (GetIsInCombat(oGanolin) == FALSE &&
                IsInConversation(oGanolin) == FALSE)
            {
                AssignCommand(oGanolin, ActionMoveToObject(oWP_Ganolin, FALSE, 1.0));
                AssignCommand(oGanolin, ActionDoCommand(SetFacing(GetFacing(oWP_Ganolin))));
            }
        }

        object oLyen = GetNearestObjectByTag("HENCH_LYEN", oPC);
        if (GetMaster(oLyen) != oPC)
        {
            object oWP_Lyen = GetWaypointByTag("WP_HR_HENCH_LYEN_0_1");
            if (GetDistanceBetween(oLyen, oWP_Lyen) > 1.0 ||
                GetFacing(oLyen) != GetFacing(oWP_Lyen))
            {
                if (GetIsInCombat(oLyen) == FALSE &&
                    IsInConversation(oLyen) == FALSE)
                {
                    AssignCommand(oLyen, ActionMoveToObject(oWP_Lyen, FALSE, 1.0));
                    AssignCommand(oLyen, ActionDoCommand(SetFacing(GetFacing(oWP_Lyen))));
                }
            }
        }
    }
}
