//::///////////////////////////////////////////////
//:: Dagget / Stone Butler (Action - Mythallar Knowledge)
//:: A_Mythallar.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player is rewarded for having learned about
     the Mythallar.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 10, 2003
//:://////////////////////////////////////////////

void main()
{
    int iNth = 1;
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, iNth);
    float fDistance = GetDistanceToObject(oPC);

    while (oPC != OBJECT_INVALID && fDistance < 20.0)
    {
        AddJournalQuestEntry("Journ_Main_20", 1, oPC, TRUE, TRUE);

        //Give the player XP if they haven't already received it.
        int bXP = GetLocalInt(oPC, "XP_Main_02");
        if (bXP == FALSE)
        {
            SetLocalInt(oPC, "XP_Main_02", TRUE);
            int iXP = FloatToInt(GetJournalQuestExperience("Journ_Main_End") * 0.04);
            GiveXPToCreature(oPC, iXP);
        }

        //Update loop variables
        iNth++;
        oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, iNth);
        fDistance = GetDistanceToObject(oPC);
    }
}
