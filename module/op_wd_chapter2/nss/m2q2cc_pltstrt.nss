//::///////////////////////////////////////////////
//:: M2Q2CC_PLTSTRT.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This sets the variable so the next time you speak with the golem,
    he recognizes you.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: January 24, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    int iJaxState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm2q2_Jax");

    SetLocalInt(GetPCSpeaker(),"M2Q2CC_L" + GetTag(OBJECT_SELF),1);

    if (iJaxState > 0 && iJaxState < 36)
    {
        AddJournalQuestEntry("m2q2_Jax", 36, oPC);
    }
}

