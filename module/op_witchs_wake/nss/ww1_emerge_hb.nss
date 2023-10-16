//::///////////////////////////////////////////////
//:: Witchwork 1: Emerge Area, Heartbeat Script
//:: WW1_Emerge_HB.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Relaunches the Barrow & Mine Cinematics if
     the player happened to save the game in the
     middle of them.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 4, 2002
//:://////////////////////////////////////////////

void SendToMines(object oPC)
{
    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oAnimalCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oMineDestination = GetObjectByTag("DST_SteinfaarMines");

    //Make the player Commandable
    while (GetCommandable(oPC) == FALSE)
    {
        SetCommandable(TRUE, oPC);
    }

    //Remove their invulnerability.
    SetPlotFlag(oPC, FALSE);

    //Teleport the player and all associates into the Mines
    AssignCommand(oPC, ActionJumpToObject(oMineDestination));
    AssignCommand(oHenchman, ActionJumpToObject(oMineDestination));
    AssignCommand(oFamiliar, ActionJumpToObject(oMineDestination));
    AssignCommand(oAnimalCompanion, ActionJumpToObject(oMineDestination));
}

void main()
{
    object oBarrowWP = GetObjectByTag("DST_BarrowSite");
    int iNth = 1;
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oBarrowWP, iNth);

    //Optimize to run the following only if it finds a PC
    while (oPC != OBJECT_INVALID)
    {
        int bInConv = IsInConversation(oPC);
        int bBarrowEnd = GetLocalInt(oPC, "CONV_BARROW_End");
        int bMineEnd = GetLocalInt(oPC, "CONV_MINE_End");
        object oMyBarrowConv = GetLocalObject(oPC, "oPool");
        object oMyMineConv = GetLocalObject(oPC, "oJagerInvis2");
        int bBarrowHBCount = GetLocalInt(oPC, "bBarrowHBCount");
        int bMineHBCount = GetLocalInt(oPC, "bMineHBCount");
        int bEndHBCount = GetLocalInt(oPC, "bEndHBCount");

        //If the player is not in conversation and has not completed the Barrow
        //conv, they're stranded. Restart the Barrow conv for them.
        if (bInConv == FALSE &&
            bBarrowEnd == FALSE)
        {
            if (bBarrowHBCount < 1)
            {
                SetLocalInt(oPC, "bBarrowHBCount", bBarrowHBCount+1);
            }
            else
            {
                SetCommandable(TRUE, oPC);
                AssignCommand(oPC, ClearAllActions(TRUE));
                AssignCommand(oMyBarrowConv, ActionStartConversation(oPC, "", TRUE));
                SetCommandable(FALSE, oPC);
            }
        }

        //If the player is not in conversation, has completed the Barrow conv
        //and has not completed the Mine conv, they're stranded. Restart the
        //Mine conv for them.
        else if (bInConv == FALSE &&
                 bBarrowEnd == TRUE &&
                 bMineEnd == FALSE)
        {
            if (bMineHBCount < 1)
            {
                SetLocalInt(oPC, "bMineHBCount", bMineHBCount+1);
            }
            else
            {
                SetCommandable(TRUE, oPC);
                AssignCommand(oPC, ClearAllActions(TRUE));
                AssignCommand(oMyMineConv, ActionStartConversation(oPC, "", TRUE));
                SetCommandable(FALSE, oPC);
            }
        }

        //If the player is not in conversation, and has completed both convs,
        //they're stranded. Jump them into to the mines.
        else if (bInConv == FALSE &&
                 bBarrowEnd == TRUE &&
                 bMineEnd == TRUE)
        {
            if (bEndHBCount < 1)
            {
                SetLocalInt(oPC, "bEndHBCount", bEndHBCount+1);
            }
            else
            {
                SendToMines(oPC);
            }
        }


        //If all else fails, reset the HB locals and jump them to the start of
        //the Barrow Conv and start again.
        else
        {
            SetLocalInt(oPC, "bBarrowHBCount", 0);
            SetLocalInt(oPC, "bMineHBCount", 0);
            SetLocalInt(oPC, "bEndHBCount", 0);

            SetCommandable(TRUE, oPC);
            ActionJumpToObject(oBarrowWP);
            AssignCommand(oPC, ClearAllActions(TRUE));
            AssignCommand(oMyBarrowConv, ActionStartConversation(oPC, "", TRUE));
            SetCommandable(FALSE, oPC);
        }

        //Check for further players in the area.
        iNth++;
        oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oBarrowWP, iNth);
    }
}
