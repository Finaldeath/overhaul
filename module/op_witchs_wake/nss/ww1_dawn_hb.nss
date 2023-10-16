//::///////////////////////////////////////////////
//:: Witchwork 1: Dawn Area, Heartbeat
//:: WW1_Dawn_HB.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Restarts the Ragpicker's conv if the player
     kicked out of it. This can happen in a couple
     of ways:
       1) Sometimes the Abort script doesn't catch
          players 'Esc'-ing out of conv;
       2) Saving and reloading the game while in
          conv.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On:October 17, 2002
//:://////////////////////////////////////////////

void main()
{
    int iNth = 1;
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, iNth);

    //Optimize to run the following only if it finds a PC
    while (oPC != OBJECT_INVALID)
    {
        int bInConv = IsInConversation(oPC);
        int bRagpickerEnd = GetLocalInt(oPC, "CONV_RAGPICKER_End");
        int bCommandable = GetCommandable(oPC);
        object oMyRagpicker = GetLocalObject(oPC, "oRagpickerInvis");

        //If the player is not in conversation and has not completed the
        //Ragpicker's conv, they're stranded. Restart her conv for them.
        if (bInConv == FALSE &&
            bRagpickerEnd == FALSE)
        {
            AssignCommand(oMyRagpicker, ActionStartConversation(oPC, "", TRUE));
        }

        //If the player has completed the Ragp's conv but isn't commandable
        //make sure they're commandable. Do it at least once to be sure.
//        do
//        {
//            SetCommandable(TRUE, oPC);
//            bCommandable = GetCommandable(oPC);
//        }
//        while (bRagpickerEnd == TRUE &&
//               bCommandable == FALSE);

        //Check for further players in the area.
        iNth++;
        oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, iNth);
    }
}
