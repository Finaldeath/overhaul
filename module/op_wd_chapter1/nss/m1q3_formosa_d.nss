//::///////////////////////////////////////////////
//:: m1q3 Formosa: User-Defined
//:: m1q3_FormosaD
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Journal updates on a custom OnDeath event.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 3, 2002
//:://////////////////////////////////////////////

void main()
{
    int iEventNumber = GetUserDefinedEventNumber();

    switch (iEventNumber)
    {
        // On Death, update the journals of all nearby players (provided
        // they already have Journal State 10.
        case 1007:
        {
            int iNth = 1;
            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, iNth);
            float fDistance = GetDistanceToObject(oPC);

            while (fDistance < 40.0)
            {
                int iFormosaState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q3_Formosa");

                if (iFormosaState == 10)
                {
                    AddJournalQuestEntry("m1q3_KillFormosa", 20, oPC);
                }

                iNth++;
                oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, iNth);
                fDistance = GetDistanceToObject(oPC);
            }
        }
    }
}
