//::///////////////////////////////////////////////
//:: Name q2d7_death_blue
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
    //if I'm dead - then the Red Gladiator mush have won..

    //Set the variables that mark the Pit fight as finished
    SetLocalInt(GetModule(), "X2_Q2DPitFightReady", 2);
    //Set variable that RED has won
    SetLocalInt(GetModule(), "X2_Q2DPitWinner", 1);
    //Set the variable for the area that marks the pit fight as finished
    SetLocalInt(GetModule(), "X2_Q2DPitFightOn", 0);

    //End Cutscene
    object oGlad = GetObjectByTag("pitgladred");
    object oAnnounce = GetObjectByTag("q2d7announcer");
    AssignCommand(oGlad, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY3));
    AssignCommand(oAnnounce, ActionMoveToObject(oGlad));
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
