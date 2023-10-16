//::///////////////////////////////////////////////
//:: M3Q2I_MORAG
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Clears Morag's actions if she tries to follow you through the transition.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 2, 2002
//:://////////////////////////////////////////////

void main()
{
    string sTag = "M3Q02G01MORA";
    object oEntering=GetEnteringObject();
    string sEntering = GetTag(oEntering);
    object oMorag=GetObjectByTag("M3Q02G01MORA");
    if (sEntering == sTag)
    {
        AssignCommand(oMorag,ClearAllActions());
    }
}
