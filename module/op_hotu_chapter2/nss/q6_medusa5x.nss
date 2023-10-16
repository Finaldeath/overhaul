//::///////////////////////////////////////////////
//:: q6_medusa5x
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets medusa riddle state to 5
    States:
    5 - player knows she has shard
    10 - riddle challenge given
    20 - First riddle failed
    30 - Second riddle failed
    99 - Riddle game over
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: September 05, 2003
//:://////////////////////////////////////////////


void main()
{
    AddJournalQuestEntry("q6_library",40,GetPCSpeaker());
    if (GetLocalInt(OBJECT_SELF,"q6_Medusa")<=5)
        {
        SetLocalInt(OBJECT_SELF,"q6_Medusa",5);
        }
}
