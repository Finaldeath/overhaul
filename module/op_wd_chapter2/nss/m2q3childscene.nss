//::///////////////////////////////////////////////
//:: Entered
//:: m2q3ChildScene
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Start the scene where a boy is taken from
    his mother.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 28, 2001
//:://////////////////////////////////////////////

void main()
{
    if (GetIsPC(GetEnteringObject()))
    {
        if (GetLocalInt(GetArea(OBJECT_SELF),"NW_A_ChildTaken") == 0 &&
            GetIsObjectValid(GetNearestObjectByTag("M2Q03CMARY")) &&
            GetIsObjectValid(GetNearestObjectByTag("M2Q03CBOY")))
        {
            SetLocalInt(GetArea(OBJECT_SELF),"NW_A_ChildTaken",10);
            SignalEvent(GetObjectByTag("M2Q03CBOY"),EventUserDefined(300));
        }
        else if (GetLocalInt(GetArea(OBJECT_SELF),"NW_A_ChildTaken") == 20)
        {
            SetLocalInt(GetArea(OBJECT_SELF),"NW_A_ChildTaken",0);
        }
    }
}
