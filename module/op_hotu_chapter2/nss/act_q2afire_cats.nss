//::///////////////////////////////////////////////
//:: Name act_q2afire_cats
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have this unit fire his catapult at the enemy
    catapults
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 19/03
//:://////////////////////////////////////////////

void main()
{
    //Get the nearest catapult and have it fire at the specified location
    object oCatapult = GetNearestObjectByTag("q2arebcatapult");
    object oTarget = GetNearestObjectByTag("q2a_bat1drowcat");
    string szTarget;
    if (GetIsObjectValid(oTarget) == FALSE)
        szTarget = "bat1_artillery_gatetarget2";
    else
        szTarget = "q2adrowcatapult";

    SetLocalString(oCatapult, "szTarget", szTarget);

}
