//::///////////////////////////////////////////////
//:: Chapter One Module Script
//:: Copyright (c) 2001 Bioware Corp.
//:: Hector stops following, journal updated.
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    SetLocalObject(OBJECT_SELF,"NW_L_FollowTarget",OBJECT_INVALID);
    //AddJournalQuestEntry("M1Q5_Aldo", 20, oPC);
    SetLocalInt(OBJECT_SELF,"NW_L_M1Q5A07HectorWithPC",FALSE);
}
