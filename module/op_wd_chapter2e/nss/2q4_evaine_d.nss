//::///////////////////////////////////////////////
//:: Evaine Custom User Defined Event
//:: 2q4_evaine_d
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the local when evaine dies.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 27, 2002
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();
    if(nUser == 1007) // DEATH
    {
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        if(GetIsObjectValid(oPC))
        {
            AddJournalQuestEntry("m2q4_Evaine", 60, oPC);
        }
        SetLocalInt(GetModule(), "NW_2Q4_EVAINE_DEAD", 10);
    }
}

