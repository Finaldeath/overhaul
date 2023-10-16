//Launch the Jhordak cutscene when the player opens the door.

void main()
{
    object oPC = GetLastOpenedBy();
    object oTemp = OBJECT_INVALID;
    location lTemp1, lTemp2;

    int iCutsceneLaunched = GetLocalInt(GetModule(), "bCS_JHORDAK_LAUNCHED");

    if (GetIsPC(oPC) == TRUE &&
        iCutsceneLaunched == FALSE)
    {
        if (GetIsPossessedFamiliar(oPC) == TRUE)
        {
            lTemp2 = GetLocation(oPC);

            oTemp = oPC;
            UnpossessFamiliar(oPC);
            oPC = GetMaster(oTemp);

            lTemp1 = GetLocation(oPC);

            SetCommandable(TRUE, oPC);
            AssignCommand(oPC, JumpToLocation(lTemp2));
            AssignCommand(oTemp, JumpToLocation(lTemp1));
        }

        //Flag the DoOnce
        SetLocalInt(GetModule(), "bCS_JHORDAK_LAUNCHED", TRUE);

        //Get the player into cutscene mode
        AssignCommand(oPC, ClearAllActions(TRUE));
        SetCutsceneMode(oPC, TRUE);

        //Destroy all of the hostile Blackhawks so they don't interfere.
        int iNth = 1;
        object oBlackhawk = GetNearestObjectByTag("BH_HOSTILE", oPC, iNth);
        while (oBlackhawk != OBJECT_INVALID)
        {
            DestroyObject(oBlackhawk);

            //Update the loop variables
            iNth++;
            oBlackhawk = GetNearestObjectByTag("BH_HOSTILE", oPC, iNth);
        }

        //Pan the player's camera to the proper direction.
        AssignCommand(oPC, SetCameraFacing(270.0, 10.0, 60.0, CAMERA_TRANSITION_TYPE_SLOW));

        //Move Lyen and the player to their waypoints.
        object oWP_PC = GetWaypointByTag("WP_CS_JHORDAK_PC");
        object oWP_Lyen = GetWaypointByTag("WP_CS_JHORDAK_LYEN");
        object oLyen = GetNearestObjectByTag("HENCH_LYEN", oPC);
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oLyen, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionForceMoveToObject(oWP_PC, FALSE, 1.0, 7.0));
        AssignCommand(oLyen, ActionForceMoveToObject(oWP_Lyen, FALSE, 1.0, 7.0));

        //Force them to face the right direction
        AssignCommand(oPC, ActionDoCommand(SetFacing(GetFacing(oWP_PC))));
        AssignCommand(oLyen, ActionDoCommand(SetFacing(GetFacing(oWP_Lyen))));

        //Have the player launch the cutscene conversation with themself.
        AssignCommand(oPC, ActionStartConversation(oPC, "sc_bh_lair", FALSE, FALSE));
    }
}
