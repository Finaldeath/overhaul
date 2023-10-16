#include "NW_I0_GENERIC"
#include "NW_O2_CONINCLUDE"
#include "NW_I0_Plot"
void main()
{
    object oPC = GetLastKiller();
    if (GetIsObjectValid(oPC) == TRUE)
    {
        // * If I have a master then use him to determine who gets the journal
        if (GetIsObjectValid(GetMaster(oPC)) == TRUE)
        {
            oPC = GetMaster(oPC);
        }
        if (GetIsPC(oPC))
        {
            int iFormosaState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q3_Formosa");
            if (iFormosaState >= 10)
            {
                AddJournalQuestEntry("m1q3_Formosa", 70, oPC);
            }
        }
    }

    location lLoc = GetLocation(GetObjectByTag("WP_M1Q3CMeldanen"));
    SetLocalInt(GetModule(),"NW_G_M1Q3AFormosa_Dead",TRUE);
    object oMeldanen;
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2);

    if(GetLocalInt(GetModule(),"NW_G_M1Q3MeldDead") == FALSE &&
       GetLocalInt(GetModule(),"NW_G_M1Q3MeldMet"))
    {
        oMeldanen = CreateObject(OBJECT_TYPE_CREATURE,"m1q3cmeldanen002",lLoc,TRUE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oMeldanen);
    }
}

