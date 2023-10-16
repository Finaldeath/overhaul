//:://////////////////////////////////////////////
/*
    Checks that the Beggar's Nest plot has been completed
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: Mar 04, 2002
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q5MainPlot")==100;
    if(bCondition)
    {
        AddJournalQuestEntry("M1Q5_Begg_2a",20,GetPCSpeaker());
    }
   return bCondition;
}

