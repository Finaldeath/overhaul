//::///////////////////////////////////////////////
//:: Entered
//:: m2MainPlotN
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This is the script for the neutral Main Plot
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
                if (!GetIsObjectValid(GetObjectByTag("M2Q6CSOLO")))
                {
                    SetLocalInt(GetModule(),"NW_G_M2MainPlotActive",150);
                    CreateObject(OBJECT_TYPE_CREATURE,"M2Q6CSOLO",GetLocation(GetNearestObjectByTag("WP_MAINPLOT")));
                }
            break;

            case 1:
                if (!GetIsObjectValid(GetObjectByTag("M2Q6CSOLO")))
                {
                    CreateObject(OBJECT_TYPE_CREATURE,"M2Q6CSOLO",GetLocation(GetNearestObjectByTag("WP_MAINPLOT")));
                }
            break;

            case 2:
            break;

            case 3:
                if (!GetIsObjectValid(GetObjectByTag("M2Q6CJAHEEL")) &&
                    GetGender(GetEnteringObject()) == GENDER_MALE)
                {
                    SetLocalInt(GetModule(),"NW_G_M2MainPlotDelay",300);
//                    AssignCommand(GetModule(),DelayCommand(1200.0,SetLocalInt(GetModule(),"NW_G_M2MainPlotActive",0)));
//                    AssignCommand(GetModule(),DelayCommand(1800.0,SignalEvent(GetModule(),EventUserDefined(100))));
                    CreateObject(OBJECT_TYPE_CREATURE,"M2Q6CJAHEEL",GetLocation(GetNearestObjectByTag("WP_MAINPLOT")));
                }
                else if (!GetIsObjectValid(GetObjectByTag("M2Q6CTARRAN")) &&
                         GetGender(GetEnteringObject()) == GENDER_FEMALE)
                {
                    SetLocalInt(GetModule(),"NW_G_M2MainPlotDelay",300);
//                    AssignCommand(GetModule(),DelayCommand(1200.0,SetLocalInt(GetModule(),"NW_G_M2MainPlotActive",0)));
//                    AssignCommand(GetModule(),DelayCommand(1800.0,SignalEvent(GetModule(),EventUserDefined(100))));
                    CreateObject(OBJECT_TYPE_CREATURE,"M2Q6CTARRAN",GetLocation(GetNearestObjectByTag("WP_MAINPLOT")));
                }
            break;

            case 4:
                if (!GetIsObjectValid(GetObjectByTag("M2Q6CBENL")))
                {
                    SetLocalInt(GetModule(),"NW_G_M2MainPlotActive",50);
                    SetLocalInt(GetModule(),"NW_G_M2Q6MainPlot",GetLocalInt(GetModule(),"NW_G_M2Q6MainPlot") + 1);
                    CreateObject(OBJECT_TYPE_CREATURE,"M2Q6CBENL",GetLocation(GetNearestObjectByTag("WP_MAINPLOT")));
                }
            break;

            case 5:
                if (!GetIsObjectValid(GetObjectByTag("M2Q6CLERN")))
                {
                    SetLocalInt(GetModule(),"NW_G_M2MainPlotActive",50);
                    SetLocalInt(GetModule(),"NW_G_M2Q6MainPlot",GetLocalInt(GetModule(),"NW_G_M2Q6MainPlot") + 1);
                    CreateObject(OBJECT_TYPE_CREATURE,"M2Q6CLERN",GetLocation(GetNearestObjectByTag("WP_MAINPLOT")));
                }
            break;

            case 6:
                if (!GetIsObjectValid(GetObjectByTag("M2Q6CTHUR")))
                {
                    SetLocalInt(GetModule(),"NW_G_M2MainPlotActive",50);
                    SetLocalInt(GetModule(),"NW_G_M2Q6MainPlot",GetLocalInt(GetModule(),"NW_G_M2Q6MainPlot") + 1);
                    CreateObject(OBJECT_TYPE_CREATURE,"M2Q6CTHUR",GetLocation(GetNearestObjectByTag("WP_MAINPLOT")));
                }
            break;

        }
    }
}
