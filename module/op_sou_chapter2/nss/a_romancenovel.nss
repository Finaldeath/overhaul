//::///////////////////////////////////////////////
//:: Romance Novel (Action - Read)
//:: A_RomanceNovel.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Jump the player to the appropriate Romance
     Novel area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 13, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    int bRewritten = GetLocalInt(OBJECT_SELF, "bRewritten");
    object oTarget;

    //Determine the proper jump target
    if (bRewritten == FALSE)
    {
        oTarget = GetObjectByTag("Library_01_Library_02");
        //Add journal entry
        //AddJournalQuestEntry("Journ_Library_20", 1, oPC, TRUE, TRUE);
        //Give the player XP if they haven't already received it.
        int bXP = GetLocalInt(oPC, "XP_Library_02");
        if (bXP == FALSE)
        {
            SetLocalInt(oPC, "XP_Library_02", TRUE);
            int iXP = FloatToInt(GetJournalQuestExperience("Journ_Library_End") * 0.04);
            GiveXPToCreature(oPC, iXP);
        }
    }
    else
    {
        oTarget = GetObjectByTag("Library_01_Library_03b");
    }

    //Jump
    AssignCommand(oPC, JumpToObject(oTarget));
}
