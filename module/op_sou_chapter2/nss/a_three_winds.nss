//::///////////////////////////////////////////////
//:: Dagget / Stone Butler (Action - 3 Winds Knowledge)
//:: A_Three_Winds.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player is flagged as having learned about the
     Three Winds.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 28, 2003
//:://////////////////////////////////////////////

void main()
{
    int iNth = 1;
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, iNth);
    float fDistance = GetDistanceToObject(oPC);

    while (oPC != OBJECT_INVALID && fDistance < 20.0)
    {
        SetLocalInt(oPC, "bThreeWinds", TRUE);
        AddJournalQuestEntry("Journ_Winds_10", 1, oPC, TRUE, TRUE);
/*DEBUG*///AssignCommand(oPC, SpeakString("DEBUG: I now know about the Three Winds."));

        //Give the player XP if they haven't already received it.
        int bXP = GetLocalInt(oPC, "XP_Main_03");
        if (bXP == FALSE)
        {
            SetLocalInt(oPC, "XP_Main_03", TRUE);
            int iXP = FloatToInt(GetJournalQuestExperience("Journ_Main_End") * 0.06);
            GiveXPToCreature(oPC, iXP);
        }

        //Update loop variables
        iNth++;
        oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, iNth);
        fDistance = GetDistanceToObject(oPC);
    }
}
