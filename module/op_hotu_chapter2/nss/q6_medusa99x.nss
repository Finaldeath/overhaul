//::///////////////////////////////////////////////
//:: q6_medusa99x
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets medusa riddle state to 99,
    gives player mirror shard
    States:
    10 - riddle challenge given
    20 - First riddle failed
    30 - Second riddle failed
    99 - Riddle game over
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: September 05, 2003
//:://////////////////////////////////////////////


#include "nw_i0_plot"

void main()
{


 AddJournalQuestEntry("q6_library",99,GetPCSpeaker());

 ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,("q6_shard")),GetPCSpeaker());

    if (GetLocalInt(OBJECT_SELF,"q6_Medusa")<=99)
        {
        SetLocalInt(OBJECT_SELF,"q6_Medusa",99);
        }
}
