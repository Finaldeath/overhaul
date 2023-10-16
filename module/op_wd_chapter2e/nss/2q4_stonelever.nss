//::///////////////////////////////////////////////
//:: Transform Garbage to Lever
//:: 2Q4_StoneLever
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Changes the pile of garbage to a lever. Also
    updates the journal entry.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 1, 2002
//:://////////////////////////////////////////////

void main()
{
    int nUsed = GetLocalInt(OBJECT_SELF, "NW_2Q4_USED_EARTH_LEVER");
    object oItem = GetItemPossessedBy(GetLastUsedBy(), "2Q4_LEVERSTONE");
    if(nUsed == 0 && GetIsObjectValid(oItem))
    {
        object oSpawn;
        object oPed = GetObjectByTag("2Q4_StonePed");
        effect eVis = EffectVisualEffect(VFX_IMP_POLYMORPH);
        int nPlot = GetLocalInt(GetModule(), "NW_2Q4_COLMARR_LEVERS");
        if(GetIsObjectValid(oItem))
        {
            location lStone = GetLocation(oPed);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lStone);
            DestroyObject(oPed, 0.5);
            DestroyObject(oItem, 0.5);
            oSpawn = CreateObject(OBJECT_TYPE_PLACEABLE, "2Q4_StoneLever", lStone);
            nPlot++;
            SetLocalInt(GetModule(), "NW_2Q4_COLMARR_LEVERS", nPlot);

            if(nPlot == 3)
            {
                SetLocalInt(GetModule(), "Contrapulator_Fixed", 1);
            }

            object oPC = GetLastUsedBy();
            int iColmarrState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm2q4_Colmarr");

            switch (iColmarrState)
            {
                case 0:
                case 10:
                {
                    AddJournalQuestEntry("m2q4_Colmarr", 20, oPC);
                }
                break;

                case 20:
                {
                    AddJournalQuestEntry("m2q4_Colmarr", 30, oPC);
                }
                break;

                case 30:
                {
                    AddJournalQuestEntry("m2q4_Colmarr", 40, oPC);
                }
                break;
            }
        }
        SetLocalInt(OBJECT_SELF, "NW_2Q4_USED_EARTH_LEVER", 1);
    }
}
