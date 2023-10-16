//::///////////////////////////////////////////////
//:: Name act_q2afire_will
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have this unit fire his catapult in front of the
    city gates
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 19/03
//:://////////////////////////////////////////////

void main()
{
    //Get the nearest catapult and have it fire at the specified location
    object oCatapult = GetNearestObjectByTag("q2arebcatapult");
    SetLocalString(oCatapult, "szTarget", "");

}
