//::///////////////////////////////////////////////
//:: Name q2_ent_trigfriens
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On enter of this trigger, the PC will notice one
    of his 'old friends' dead on the ground in front
    of him and have a journal entry created.
    If one of the Henchmen is with the PC - have them
    react to the body...
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 12/02
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
        if (GetTag(OBJECT_SELF) == "SharwynTrig")
        {
            AddJournalQuestEntry("q2sharwyn", 10, oPC);
        }
        else if (GetTag(OBJECT_SELF) == "TomiTrig")
        {
            AddJournalQuestEntry("q2tomi", 10, oPC);
        }
        else if (GetTag(OBJECT_SELF) == "DaelanTrig")
        {
            AddJournalQuestEntry("q2daelan", 10, oPC);
        }

        //DEBUG
        //FloatingTextStringOnCreature("nJournal = " + IntToString(nJournal), GetFirstPC());
        //DEBUG
    }

}
