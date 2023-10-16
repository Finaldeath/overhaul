//::///////////////////////////////////////////////
//:: km_genhos_death
//:: Copyright (c) 2004 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This will count down the number of dead hostiles and
    when there are none left it will automatically initiate the cutscene.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: May 2004
//:://////////////////////////////////////////////

void main()
{
    int iHostiles = GetLocalInt(GetModule(), "GENHOSTILE_COUNT") - 1;
    SetLocalInt(GetModule(), "GENHOSTILE_COUNT", iHostiles);

    //AssignCommand(GetFirstPC(),
    //    SpeakString("Hostiles left : " + IntToString(iHostiles)));

    if (iHostiles <= 0)
    {
        //AssignCommand(GetFirstPC(),
        //    SpeakString("Executing km_cutstart2"));
        DelayCommand(IntToFloat(Random(999)), ActionSpeakStringByStrRef(40499));
        ExecuteScript("km_cutstart2a", GetModule());
    }
}
