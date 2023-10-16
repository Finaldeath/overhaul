//::///////////////////////////////////////////////
//:: Name q2d7_death_pcred
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Blue Gladiator Death Script

    Fight Winner
    X2_Q2DPitWinner = 1   - Red
    X2_Q2DPitWinner = 2   - Blue
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////


void main()
{
    //if I'm dead - then the Blue Gladiator mush have won..

    //Set the variables that mark the Pit fight as finished
    SetLocalInt(GetModule(), "X2_Q2DPitFightReady", 2);
    //Set variable that BLUE has won
    SetLocalInt(GetModule(), "X2_Q2DPitWinner", 2);
    //Set the variable for the area that marks the pit fight as finished
    SetLocalInt(GetModule(), "X2_Q2DPitFightOn", 0);

    //Set variable that PCs slave is dead
    //SetLocalInt(GetModule(), "X2_Q2DSlaveFight", 2);
    AddJournalQuestEntry("q2_femslave", 98, GetFirstPC(), TRUE, TRUE);

    //End Cutscene
    //End Cutscene
    object oGlad = GetObjectByTag("pitgladblue");
    AssignCommand(oGlad, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY2));
    //Announcer Speaks

    //Signal Area event to disable cutscene

    if (GetLocalInt(OBJECT_SELF, "nSignal") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nSignal", 1);
        object oArea = GetArea(OBJECT_SELF);
        SignalEvent(oArea, EventUserDefined(101));
    }

    ExecuteScript("nw_c2_default7", OBJECT_SELF);
}
