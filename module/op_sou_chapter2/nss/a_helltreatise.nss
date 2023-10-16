//::///////////////////////////////////////////////
//:: Hell Treatise (Action - Read)
//:: A_HellTreatise.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Jump the player to the Hell Treatise area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 14, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    int bRewritten = GetLocalInt(OBJECT_SELF, "bRewritten");
    object oTarget;

    //Determine the proper jump target.
    if (bRewritten == FALSE)
    {
        oTarget = GetObjectByTag("Library_03_Library_04a");
        //AddJournalQuestEntry("Journ_Library_50", 1, oPC, TRUE, TRUE);
        //Give the player XP if they haven't already received it.
        int bXP = GetLocalInt(oPC, "XP_Library_04");
        if (bXP == FALSE)
        {
            SetLocalInt(oPC, "XP_Library_04", TRUE);
            int iXP = FloatToInt(GetJournalQuestExperience("Journ_Library_End") * 0.04);
            GiveXPToCreature(oPC, iXP);
        }
    }
    else
    {
        oTarget = GetObjectByTag("Library_03_Library_04b");
    }

    //Jump
    AssignCommand(oPC, JumpToObject(oTarget));
}
