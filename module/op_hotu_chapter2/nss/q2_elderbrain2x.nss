//::///////////////////////////////////////////////
//:: q2_elderbrain2x
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Set global to 2
   Player agreed to get mirror
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: Sept. 12, 2003
//:://////////////////////////////////////////////


void main()
{

      AddJournalQuestEntry("q2_zorvakmur",30,GetPCSpeaker(),TRUE, FALSE, TRUE);
    if (GetLocalInt(GetModule(),"elder_brain")<=2)
        {
        SetLocalInt(GetModule(),"elder_brain",2);
        }
}
