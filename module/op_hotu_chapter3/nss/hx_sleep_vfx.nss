//::///////////////////////////////////////////////
//:: Name hx_sleep_vfx
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Creates VFX for Sleeping Man.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Edited By: Brad Prince
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    int bDoOnce = GetLocalInt(OBJECT_SELF, "bDoOnce");

    if(GetEnteringObject() == oPC)
    {
        if (bDoOnce == FALSE)
        {
            //Flag the DoOnce
            SetLocalInt(OBJECT_SELF, "bDoOnce", TRUE);

            //Loop through all the VFX targets
            int iBigby = 0;
            object oBigby = GetObjectByTag("WP_BigbyVFX", iBigby);
            while (oBigby != OBJECT_INVALID)
            {
                //Apply VFX
                //location lBigby = GetLocation(oBigby);
                effect eBigby = EffectVisualEffect(VFX_DUR_BIGBYS_INTERPOSING_HAND);
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBigby, oBigby);

                //Update Loop Variables
                iBigby++;
                oBigby = GetObjectByTag("WP_BigbyVFX", iBigby);
            }

            //Add the journal entries
            AddJournalQuestEntry("XP2_Pilgrims", 90, oPC, TRUE, TRUE);
            AddJournalQuestEntry("XP2_Mystery1", 40, oPC, TRUE, TRUE);
            AddJournalQuestEntry("XP2_Mystery2", 40, oPC, TRUE, TRUE);
            AddJournalQuestEntry("XP2_Mystery3", 40, oPC, TRUE, TRUE);
            AddJournalQuestEntry("XP2_Mystery4", 40, oPC, TRUE, TRUE);
            AddJournalQuestEntry("XP2_Mystery5", 40, oPC, TRUE, TRUE);
        }
    }
}
