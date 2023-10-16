//::///////////////////////////////////////////////
//:: Witchwork 1: Start Area, Heartbeat
//:: WW1_Start_HB.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Restarts Prince Ahmed's conv if the player
     kicked out of it. This can happen in a couple
     of ways:
       1) Sometimes the Abort script doesn't catch
          players 'Esc'-ing out of conv;
       2) Saving and reloading the game while in
          conv.

     Also handles the cutscene soldiers.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On:October 17, 2002
//:://////////////////////////////////////////////

void main()
{
    int iNth = 1;
    int bCinematicOn = GetLocalInt(OBJECT_SELF, "bCinematicOn");
    object oSoldier = GetObjectByTag("UnknownSoldier");

/* ---> Player now in cutscene mode and can no longer escape the conversation.
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oSoldier, iNth);

    //Optimize to run the following only if it finds a PC
    while (oPC != OBJECT_INVALID)
    {
        int bInConv = IsInConversation(oPC);
        int bAhmedEnd = GetLocalInt(oPC, "CONV_AHMED_End");
        object oMyAhmed = GetLocalObject(oPC, "oAhmedConversation");

        //If the player is not in conversation and has not completed Prince
        //Ahmed's conv, they're stranded. Restart his conv for them.
        if (bInConv == FALSE &&
            bAhmedEnd == FALSE)
        {
            AssignCommand(oMyAhmed, ActionStartConversation(oPC, "", TRUE));
        }

        //Check for further players in the area.
        iNth++;
        oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oSoldier, iNth);
    }
*/
    //Handle the soldiers' combat.
    if (bCinematicOn == TRUE)
    {
        //Loop through the soldiers...
        oSoldier = GetFirstFactionMember(oSoldier, FALSE);
        while (oSoldier != OBJECT_INVALID)
        {
            //Make them attack each other.
//            AssignCommand(oSoldier, ClearAllActions());
            AssignCommand(oSoldier, ActionAttack(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY)));

            //Update the loop variable.
            oSoldier = GetNextFactionMember(oSoldier, FALSE);
        }
    }
}
