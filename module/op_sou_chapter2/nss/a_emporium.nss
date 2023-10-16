//::///////////////////////////////////////////////
//:: Undrentide Golems (Action - Emporium Ad)
//:: A_Emporium.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player is flagged as having heard the
     guardian golems advertise their maker.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 27, 2003
//:://////////////////////////////////////////////

void main()
{
    int iNth = 1;
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, iNth);
    float fDistance = GetDistanceToObject(oPC);

    while (oPC != OBJECT_INVALID && fDistance < 20.0)
    {
        SetLocalInt(oPC, "bGolemEmporium", TRUE);
        AddJournalQuestEntry("Journ_Ashtara_20", 1, oPC, TRUE, TRUE);
/*DEBUG*///AssignCommand(oPC, SpeakString("DEBUG: I now know about the Emporium."));
        iNth++;
        oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, iNth);
        fDistance = GetDistanceToObject(oPC);
    }
}
