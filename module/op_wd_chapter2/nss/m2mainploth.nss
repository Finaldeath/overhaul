//::///////////////////////////////////////////////
//:: Entered
//:: m2MainPlotH
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This is the script for the hostile Main Plot
    triggers.  Each trigger placed needs a waypoint
    named WP_MAINPLOT.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 8, 2002
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(),"NW_G_M2MainPlotActive") == 0 && GetIsPC(GetEnteringObject()))
    {
        switch (GetLocalInt(GetModule(),"NW_G_M2Q6MainPlot"))
        {
            case 0:
            break;

            case 1:
            break;

            case 2:
                if (!GetIsObjectValid(GetObjectByTag("M2Q6CSOLO")) &&
                     GetLocalInt(GetModule(),"NW_G_SolomonDone") == 0)
                {
                    SetLocalInt(GetModule(),"NW_G_SolomonDone",1);
//                    AssignCommand(GetModule(),DelayCommand(10.0,SetLocalInt(GetModule(),"NW_G_M2MainPlotActive",0)));
                    CreateObject(OBJECT_TYPE_CREATURE,"M2Q6CSOLO",GetLocation(GetNearestObjectByTag("WP_MAINPLOT")));
                    CreateObject(OBJECT_TYPE_CREATURE,"M2Q6CSOLOGRD",GetLocation(GetNearestObjectByTag("WP_MAINPLOT")));
                    CreateObject(OBJECT_TYPE_CREATURE,"M2Q6CSOLOGRD",GetLocation(GetNearestObjectByTag("WP_MAINPLOT")));
                }
            break;

            case 3:
            break;

            case 4:
            break;

            case 5:
            break;

            case 6:
            break;

            case 7:
                if (!GetIsObjectValid(GetObjectByTag("M2Q6CVARD")))
                {
                    SetLocalInt(GetModule(),"NW_G_M2MainPlotActive",1);
                    AssignCommand(GetModule(),DelayCommand(10.0,SetLocalInt(GetModule(),"NW_G_M2MainPlotActive",0)));
                    CreateObject(OBJECT_TYPE_CREATURE,"M2Q6CVARD",GetLocation(GetNearestObjectByTag("WP_MAINPLOT")));
                }
            break;

        }
    }
}
